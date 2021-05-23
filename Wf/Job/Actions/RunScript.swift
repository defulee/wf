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
    
    init(interpreter: ScriptInterpreter = .bash, input: ScriptInput = .query, script: String = "") {
        self.interpreter = interpreter
        self.input = input
        self.script = script
        
        super.init(type: .RunScript, desc: "Run Script")
    }
    
    override func exec(flowId: String, jobId: String, arg: String) -> String {
        print("ScriptJob run...")

        let suffix = self.suffix()
        let path = NSTemporaryDirectory() + "\(jobId).\(suffix)"
        
        if input == .query {
            let realScript = script.replacingOccurrences(of: "{query}", with: arg)
            try! realScript.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
        }
        return exec(scriptFilePath: path, arg: arg)
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
