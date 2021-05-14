//
//  FlowJob.swift
//  wf
//
//  Created by defu.li on 2021/5/14.
//

import Foundation



struct FlowJob: Codable {
    var jobId: String
    var nextJobIds: [String]
    var xpos: CGFloat
    var ypos: CGFloat
    
    init(jobId: String, nextJobIds: [String] = [String](), xpos: CGFloat, ypos: CGFloat) {
        self.jobId = jobId
        self.nextJobIds = nextJobIds
        self.xpos = xpos
        self.ypos = ypos
    }
}
