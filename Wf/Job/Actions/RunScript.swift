//
//  ScriptJob.swift
//  Wf
//
//  Created by defu.li on 2021/5/5.
//

import Foundation


class RunScript: Job {
    var interpreter: ScriptInterpreter
    var input: ScriptInput
    var script: String
    
    init(id: String, interpreter: ScriptInterpreter = .bash, input: ScriptInput = .query, script: String = "", xpos: CGFloat = 0, ypos: CGFloat = 0) {
        self.interpreter = interpreter
        self.input = input
        self.script = script
        
        super.init(id: id, type: .RunScript, desc: "Run Script", xpos: xpos, ypos: ypos)
    }
    
    override func exec(flowId: String, jobId: String, arg: String) -> String {
        print("ScriptJob run...")

        let suffix = self.suffix()
        let path = NSTemporaryDirectory() + "\(jobId).\(suffix)"
        
        var toExecScript = self.script
        if input == .query {
            toExecScript = script.replacingOccurrences(of: "{query}", with: arg)
        }
        try! toExecScript.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
        // 执行脚本
        let rst = exec(scriptFilePath: path, arg: arg)
        // 执行完之后清除脚本
        try! FileManager.default.removeItem(atPath: path)
        
        return rst
    }
    
    func suffix() -> String {
        switch interpreter {
        case .bash, .zsh:
            return "sh"
        case .python:
            return "py"
        }
    }
    
    func exec(scriptFilePath: String, arg: String) -> String {
        switch self.interpreter {
        case .bash, .zsh:
            do {
                let bash = Bash()
                return try bash.run(commandName: scriptFilePath, arguments: [arg])
            } catch {
                fatalError("RunScript error:\n\(error)")
            }
        case .python:
            do {
                let bash = Bash()
                return try bash.run(commandName: scriptFilePath, arguments: [arg])
            } catch {
                fatalError("RunScript error:\n\(error)")
            }
        }
    }
}
