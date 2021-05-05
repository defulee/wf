//
//  ScriptInput.swift
//  Wf
//
//  Created by defu.li on 2021/5/5.
//

import Foundation

enum ScriptInput: String, CaseIterable, Identifiable, Codable {
    case query = "with input as {query}"
    case argv = "with input as argv"

    var id: ScriptInput { self }
}
