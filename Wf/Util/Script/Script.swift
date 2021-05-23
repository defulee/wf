//
//  Script.swift
//  Truck
//
//  Created by defu.li on 2021/4/27.
//

import Foundation


protocol Script {
    func run(commandName: String, arguments: [String]) throws -> String
}

enum ScriptError: Error {
    case commandNotFound(name: String)
}
