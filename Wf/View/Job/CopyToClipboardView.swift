//
//  CopyToClipboardView.swift
//  wf
//
//  Created by defu.li on 2021/5/22.
//

import SwiftUI

struct CopyToClipboardView: View {
    @State var isEditorPresented = false
    @State var job: CopyToClipboard
        
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(Color(hex: 0xE6E6E6)).frame(width: 120.0, height: 100.0)
       
            VStack {
                Text("")
                    .foregroundColor(.black)
            
                Image(systemName: "doc.on.clipboard")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 32.0, height: 32.0)
                    .onTapGesture(count: 1, perform: {
                        print("CopyToClipboardView image onTapGesture...")
                        self.isEditorPresented = true
                    })
                    .sheet(isPresented: $isEditorPresented, content: {
//                        RunScriptEditorView(job: $job, submit: {
//                            self.isEditorPresented = false
//                            //TODO 节点持久化
//
//                        })
                    })
                Text(self.job.desc)
                    .foregroundColor(.black)
                           
            }
            .frame(width: 120.0, height: 100.0)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: 0xE6E6E6)))
            
        }
    }
}

struct CopyToClipboardView_Previews: PreviewProvider {
    static var job: CopyToClipboard = CopyToClipboard(id: "")

    
    static var previews: some View {
        CopyToClipboardView(job: job)
    }
}
