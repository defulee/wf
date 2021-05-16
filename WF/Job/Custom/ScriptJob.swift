//
//  ScriptJob.swift
//  Wf
//
//  Created by defu.li on 2021/5/5.
//

import Foundation


class ScriptJob: Job {
    var interpreter: ScriptInterpreter
    var input: ScriptInput
    var script: String
    
    init(id: String, interpreter: ScriptInterpreter = .bash, input: ScriptInput = .query, script: String = "") {
        self.interpreter = interpreter
        self.input = input
        self.script = script
        
        super.init(id: id, type: .ScriptJob, desc: "Script Job")
    }
    
    override func exec() -> String {
        print("ScriptJob run...")
        return "test return"
    }
    
}
