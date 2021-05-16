//
//  FlowJob.swift
//  wf
//
//  Created by defu.li on 2021/5/14.
//

import Foundation



class FlowScriptJob: Identifiable{
    var job: ScriptJob
    var xpos: CGFloat
    var ypos: CGFloat
    
    init(job: ScriptJob, xpos: CGFloat, ypos: CGFloat) {
        self.job = job
        self.xpos = xpos
        self.ypos = ypos
    }

}
