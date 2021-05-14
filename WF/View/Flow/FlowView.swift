//
//  FlowView.swift
//  wf
//
//  Created by defu li on 2021/5/14.
//

import SwiftUI

struct FlowView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
            Text("Hello, World!")
            
            ScriptJobView(job: ScriptJob(id: "test", interpreter: .bash, input: .query, script: "ls -al"))
                .position(x:150.0, y: 100.0)
            
            ScriptJobView(job: ScriptJob(id: "test", interpreter: .bash, input: .query, script: "ls -al"))
                .position(x: 0.0, y: 0.0)
        })
        .frame(width: 800, height: 600)
    }
}

struct FlowView_Previews: PreviewProvider {
    static var previews: some View {
        FlowView()
    }
}
