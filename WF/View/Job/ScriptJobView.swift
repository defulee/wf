//
//  ScriptNodeView.swift
//  Wf
//
//  Created by defu.li on 2021/5/4.
//

import SwiftUI


struct ScriptJobView: View {
    @State var isEditorPresented = false
    @State var job: ScriptJob
        
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(Color(hex: 0xE6E6E6)).frame(width: 120.0, height: 100.0)
       
            VStack {
                Text(self.job.interpreter.rawValue)
                    .foregroundColor(.black)
                
                Image("script")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60.0, height: 50.0)
                    .onTapGesture(count: 1, perform: {
                        print("ScriptJobView image onTapGesture...")
                        self.isEditorPresented = true
                    })
                    .sheet(isPresented: $isEditorPresented, content: {
                        ScriptEditorView(job: $job, submit: {
                            self.isEditorPresented = false
                            //TODO 节点持久化
                            
                        })
                    })
                Text(self.job.desc)
                    .foregroundColor(.black)
                           
            }
            .frame(width: 120.0, height: 100.0)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: 0xE6E6E6)))
            
        }
    }
}

struct ScriptJobView_Previews: PreviewProvider {
    static var job: ScriptJob = ScriptJob(id: "test")
    
    static var previews: some View {
        ScriptJobView(job: job)
    }
}
