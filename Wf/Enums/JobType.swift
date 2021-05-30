//
//  JobType.swift
//  wf
//
//  Created by defu.li on 2021/5/16.
//

import Foundation

enum JobType: String, CaseIterable, Identifiable, Codable {
    case RunScript = "action.script"
    case ListFilter = "output.filter"
    case PostNotification = "output.notification"
    case CopyToClipboard = "output.clipboard"
//    case Empty = "output.empty"

    var id: JobType { self }
}
