//
//  FlowJob.swift
//  wf
//
//  Created by defu.li on 2021/5/14.
//

import Foundation



class FlowJob: Identifiable{
    var id: String
    var job: Job
    var xpos: CGFloat
    var ypos: CGFloat
    
    init(id: String, job: Job, xpos: CGFloat, ypos: CGFloat) {
        self.id = id
        self.job = job
        self.xpos = xpos
        self.ypos = ypos
    }

}
