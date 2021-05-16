//
//  JobType.swift
//  wf
//
//  Created by defu.li on 2021/5/16.
//

import Foundation

enum JobType: String, CaseIterable, Identifiable, Codable {
    case ScriptJob = "ScriptJob"
    case BuiltInJob = "BuiltInJob"

    var id: JobType { self }
}
