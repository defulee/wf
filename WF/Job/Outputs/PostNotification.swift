//
//  NotificationJob.swift
//  wf
//
//  Created by defu.li on 2021/5/17.
//

import Foundation

import SwiftUI

class PostNotification: Job {
    
    override func exec() -> String {
        print("job run...")
        return "job return"
    }
}
