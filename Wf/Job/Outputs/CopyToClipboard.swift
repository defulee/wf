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
    
    
    init(id: String, text: String = "{query}", xpos: CGFloat = 0, ypos: CGFloat = 0) {
        self.text = text
        
        super.init(id: id, type: .CopyToClipboard, desc: "Copy to Clipboard", xpos: xpos, ypos: ypos)
    }
    
    override func exec(flowId: String, jobId: String, arg: String) -> String {
        print("CopyToClipboard run...")
        return "job return"
    }
}
