//
//  Job.swift
//  wf
//
//  Created by defu.li on 2021/5/15.
//

import Foundation

class Job: Encodable, Identifiable {
    var id: String
    var type: JobType
    var desc: String
    
    var xpos: CGFloat
    var ypos: CGFloat
    
    init(id: String, type: JobType, desc: String = "", xpos: CGFloat = 0, ypos: CGFloat = 0) {
        self.id = id
        self.type = type
        self.desc = desc
        self.xpos = xpos
        self.ypos = ypos
    }
    
    func exec(flowId: String, jobId: String, arg: String) -> String {
        print("job run...")
        return "job return"
    }
}
