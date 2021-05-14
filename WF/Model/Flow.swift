//
//  Flow.swift
//  wf
//
//  Created by defu.li on 2021/5/14.
//

import Foundation



struct Flow: Codable {
    var firstJob: FlowJob
    
    init(job: FlowJob) {
        self.firstJob = job
    }
}
