//
//  NotificationJob.swift
//  wf
//
//  Created by defu.li on 2021/5/17.
//

import Foundation

import SwiftUI

class PostNotification: Job {
    var title: String
    var text: String
    
    
    init(title: String, text: String = "{query}") {
        self.title = title
        self.text = text
        
        super.init(type: .PostNotification, desc: "Post Notification")
    }
    
    override func exec(flowId: String, jobId: String, arg: String) -> String {
        print("PostNotification run...")
        return "job return"
    }
}
