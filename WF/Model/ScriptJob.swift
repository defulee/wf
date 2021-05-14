//
//  ScriptJob.swift
//  Wf
//
//  Created by defu.li on 2021/5/5.
//

import Foundation


struct ScriptJob: Codable, Identifiable {
    var id: String
    var type: String
    var interpreter: ScriptInterpreter
    var input: ScriptInput
    var script: String
    var pos: CGPoint
    
    init(id: String, interpreter: ScriptInterpreter, input: ScriptInput, script: String, pos: CGPoint = CGPoint(x: 0.0, y: 0.0)) {
        self.id = id
        self.type = "job"
        self.interpreter = interpreter
        self.input = input
        self.script = script
        self.pos = pos
    }
}
