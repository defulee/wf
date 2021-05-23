//
//  Job.swift
//  wf
//
//  Created by defu.li on 2021/5/15.
//

import Foundation

class Job: Encodable {
    var type: JobType
    var desc: String
    
    init(type: JobType, desc: String = "") {
        self.type = type
        self.desc = desc
    }
    
    func exec(flowId: String, jobId: String, arg: String) -> String {
        print("job run...")
        return "job return"
    }
}
