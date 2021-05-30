//
//  Flow.swift
//  wf
//
//  Created by defu.li on 2021/5/14.
//

import Foundation



class Flow : Identifiable {
    var id: String
    var jobs: [Job]
    var connections: [FlowConnection]
    
    
    init(jobs: [Job], connections: [FlowConnection]) {
        self.id = "flow"
        self.jobs = jobs
        self.connections = connections
    }
    
    func srcPos(connection : FlowConnection) -> CGPoint {
        for job in self.jobs {
            if (job.id == connection.srcJobId) {
                return CGPoint(x: job.xpos + 60, y: job.ypos)
            }
        }
        
        return CGPoint(x: 0, y: 0)
    }
    
    func connections(connection : FlowConnection) -> [Connection] {
        let srcPos = self.srcPos(connection: connection)
        var cnts = [Connection]()
        for destJobId in connection.destJobIds {
            for flowJob in self.jobs {
                if (flowJob.id == destJobId) {
                    cnts.append(Connection(srcPos: CGPoint(x: srcPos.x, y: srcPos.y),
                                           destPos: CGPoint(x: flowJob.xpos - 60, y: flowJob.ypos)))
                }
            }
        }
        
        return cnts
    }
    
}
