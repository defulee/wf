//
//  Job.swift
//  wf
//
//  Created by defu.li on 2021/5/15.
//

import Foundation

class Job {
    var id: String
    var type: JobType
    var desc: String
    
    init(id: String, type: JobType, desc: String = "") {
        self.id = id
        self.type = type
        self.desc = desc
    }
    
    func exec() -> String {
        print("job run...")
        return "job return"
    }
}
