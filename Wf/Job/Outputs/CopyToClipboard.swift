//
//  CopyToClipboardJob.swift
//  wf
//
//  Created by defu.li on 2021/5/17.
//

import Foundation
import SwiftUI

class CopyToClipboard: Job {
    var text: String
    
    
    init(text: String = "{query}") {
        self.text = text
        
        super.init(type: .CopyToClipboard, desc: "Copy to Clipboard")
    }
    
    override func exec(flowId: String, jobId: String, arg: String) -> String {
        print("CopyToClipboard run...")
        return "job return"
    }
}
