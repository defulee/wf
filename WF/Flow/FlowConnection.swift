//
//  FlowConnection.swift
//  wf
//
//  Created by defu.li on 2021/5/16.
//

import Foundation


class FlowConnection : Identifiable{
    var srcJobId: String
    var destJobIds: [String]
    
    init(srcJobId: String, destJobIds: [String]) {
        self.srcJobId = srcJobId
        self.destJobIds = destJobIds
    }

}

class Connection : Identifiable {
    var srcPos: CGPoint
    var destPos: CGPoint
    
    init(srcPos: CGPoint, destPos: CGPoint) {
        self.srcPos = srcPos
        self.destPos = destPos
    }
}
