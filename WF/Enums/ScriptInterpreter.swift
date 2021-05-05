//
//  JobEditorAction.swift
//  Wf
//
//  Created by defu.li on 2021/5/5.
//

import Foundation


enum ScriptInterpreter: String, CaseIterable, Identifiable, Codable {
    case bash = "/bin/bash"
    case zsh = "/bin/zsh"
    case python = "/usr/bin/python"

    var id: ScriptInterpreter { self }
}

