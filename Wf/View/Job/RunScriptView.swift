//
//  ScriptNodeView.swift
//  Wf
//
//  Created by defu.li on 2021/5/4.
//

import SwiftUI


struct RunScriptView: View {
    @State var isEditorPresented = false
    @State var job: RunScript
    let id: String
        
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(Color(hex: 0xE6E6E6)).frame(width: 120.0, height: 100.0)
       
            VStack {
                Text(self.job.interpreter.rawValue)
                    .foregroundColor(.black)
                
//                Image("script")
                Image(systemName: "applescript")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 32.0, height: 32.0)
                    .onTapGesture(count: 1, perform: {
                        print("ScriptJobView image onTapGesture...")
                        self.isEditorPresented = true
                    })
                    .sheet(isPresented: $isEditorPresented, content: {
                        RunScriptEditorView(id: self.id, job: $job, submit: {
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

struct RunScriptView_Previews: PreviewProvider {
    static var job: RunScript = RunScript()
    
    static var previews: some View {
        RunScriptView(job: job, id: "")
    }
}
