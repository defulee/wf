//
//  JobType.swift
//  wf
//
//  Created by defu.li on 2021/5/16.
//

import Foundation

enum JobType: String, CaseIterable, Identifiable, Codable {
    case RunScript = "action.script"
    case PostNotification = "output.notification"
    case CopyToClipboard = "output.clipboard"

    var id: JobType { self }
}
