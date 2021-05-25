//
//  ListFilter.swift
//  wf
//
//  Created by defu.li on 2021/5/25.
//

import Foundation
import SwiftUI




class ListFilter: Job {
    var text: String
    
    init(id: String, text: String = "{query}", xpos: CGFloat = 0, ypos: CGFloat = 0) {
        self.text = text
        
        super.init(id: id, type: .ListFilter, desc: "List Filter", xpos: xpos, ypos: ypos)
    }
    
    override func exec(flowId: String, jobId: String, arg: String) -> String {
        print("ListFilter run...")
        
        return "job return"
    }
}
