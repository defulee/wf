//
//  FlowView.swift
//  wf
//
//  Created by defu li on 2021/5/14.
//

import SwiftUI

struct Bezier: Shape {
    var relatePos: CGPoint
    var srcPos: CGPoint
    var destPos: CGPoint
    
    func path(in rect: CGRect) -> Path
    {
        var path = Path()
        path.move(to: CGPoint(x: relatePos.x + srcPos.x, y: relatePos.y + srcPos.y))
        path.addCurve(to: CGPoint(x: relatePos.x + destPos.x, y: relatePos.y + destPos.y),
                      control1: CGPoint(x: relatePos.x + (srcPos.x + destPos.x)/2, y: relatePos.y + srcPos.y),
                      control2: CGPoint(x: relatePos.x + (srcPos.x + destPos.x)/2, y: relatePos.y + destPos.y)
        )
        return path
    }
}
    
struct FlowView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        let flow = modelData.flows[0]
            
        GeometryReader { gr in
            ForEach(flow.jobs) { flowJob in
                switch flowJob.job.type {
                case .RunScript:
                    RunScriptView(job: flowJob.job as! RunScript, id: flowJob.id)
                        .position(x: gr.frame(in: .global).minX + flowJob.xpos, y: gr.frame(in: .global).minY + flowJob.ypos)
                case .PostNotification:
                    PostNotificationView(job: flowJob.job as! PostNotification)
                        .position(x: gr.frame(in: .global).minX + flowJob.xpos, y: gr.frame(in: .global).minY + flowJob.ypos)
                case .CopyToClipboard:
                    CopyToClipboardView(job: flowJob.job as! CopyToClipboard)
                        .position(x: gr.frame(in: .global).minX + flowJob.xpos, y: gr.frame(in: .global).minY + flowJob.ypos)
                }
                
            }
            
            ForEach(flow.connections) { connection in
                let cnts = flow.connections(connection: connection)
                ForEach(cnts) { cnt in
                    Bezier(relatePos: CGPoint(x: gr.frame(in: .global).minX, y:gr.frame(in: .global).minY),
                           srcPos: cnt.srcPos,
                           destPos: cnt.destPos)
                        .stroke(lineWidth: 3)
                        .foregroundColor(.gray)
                }
            }
        }

    }
}

struct FlowView_Previews: PreviewProvider {
    @StateObject private var modelData = ModelData()
    
    static var previews: some View {
        FlowView()
    }
}
