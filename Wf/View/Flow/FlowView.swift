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
    @EnvironmentObject var env: Env
    
    var body: some View {
        let flow = env.flows[0]
            
        GeometryReader { gr in
            ForEach(flow.jobs) { job in
                switch job.type {
                case .RunScript:
                    RunScriptView(job: job as! RunScript)
                        .position(x: gr.frame(in: .global).minX + job.xpos, y: gr.frame(in: .global).minY + job.ypos)
                case .ListFilter:
                    ListFilterView(job: job as! ListFilter)
                        .position(x: gr.frame(in: .global).minX + job.xpos, y: gr.frame(in: .global).minY + job.ypos)
                case .PostNotification:
                    PostNotificationView(job: job as! PostNotification)
                        .position(x: gr.frame(in: .global).minX + job.xpos, y: gr.frame(in: .global).minY + job.ypos)
                case .CopyToClipboard:
                    CopyToClipboardView(job: job as! CopyToClipboard)
                        .position(x: gr.frame(in: .global).minX + job.xpos, y: gr.frame(in: .global).minY + job.ypos)
                    
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
    @StateObject private var env = Env()
    
    static var previews: some View {
        FlowView()
    }
}
