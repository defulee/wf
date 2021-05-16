//
//  Flow.swift
//  wf
//
//  Created by defu.li on 2021/5/14.
//

import Foundation



class Flow : Identifiable {
    var id: String
    var scriptJobs: [FlowScriptJob]
    var connections: [FlowConnection]
    
    init(scriptJobs: [FlowScriptJob], connections: [FlowConnection]) {
        self.id = "flow"
        self.scriptJobs = scriptJobs
        self.connections = connections
    }
    
    func srcPos(connection : FlowConnection) -> CGPoint {
        for flowJob in self.scriptJobs {
            if (flowJob.job.id == connection.srcJobId) {
                return CGPoint(x: flowJob.xpos + 60, y: flowJob.ypos)
            }
        }
        
        return CGPoint(x: 0, y: 0)
    }
    
    func connections(connection : FlowConnection) -> [Connection] {
        let srcPos = self.srcPos(connection: connection)
        var cnts = [Connection]()
        for destJobId in connection.destJobIds {
            for flowJob in self.scriptJobs {
                if (flowJob.job.id == destJobId) {
                    cnts.append(Connection(srcPos: CGPoint(x: srcPos.x, y: srcPos.y),
                                           destPos: CGPoint(x: flowJob.xpos - 60, y: flowJob.ypos)))
                }
            }
        }
        
        return cnts
    }
    
}
