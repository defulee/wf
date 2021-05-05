//
//  ScriptJob.swift
//  Wf
//
//  Created by defu.li on 2021/5/5.
//

import Foundation


struct ScriptJob: Hashable, Codable, Identifiable {
    var id: String
    var type: String
    var interpreter: ScriptInterpreter
    var input: ScriptInput
    var script: String
    
    init(id: String, interpreter: ScriptInterpreter, input: ScriptInput, script: String) {
        self.id = id
        self.type = "job"
        self.interpreter = interpreter
        self.input = input
        self.script = script
    }
}
