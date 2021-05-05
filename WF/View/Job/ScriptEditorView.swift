//
//  ScriptEditorView.swift
//  Wf
//
//  Created by defu.li on 2021/5/4.
//

import SwiftUI
import PListKit

struct ScriptEditorView: View {
    @Binding var job: ScriptJob

    var submit: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 20) {
                Group {
                    Picker("Interpreter：", selection: $job.interpreter) {
                        ForEach(ScriptInterpreter.allCases) { interpreter in
                            Text(interpreter.rawValue).tag(interpreter)
                        }
                    }
                    .frame(width: 220)
                    
                    Picker("Input：", selection: $job.input) {
                        ForEach(ScriptInput.allCases) { input in
                            Text(input.rawValue).tag(input)
                        }
                    }
                    .frame(width: 220)
                    
                    Group {
                        Text("Description: ")
                        TextField("Script Description", text: $job.id)
                    }
                }
            }
            
            Group {
                Text("Script Code:")
                TextEditor(text: $job.script)
                    .lineSpacing(3)
                    .font(.body)
                    .disableAutocorrection(true)
                    .border(Color.gray)
            }
        
            
            Text("Replaces {query} in your script with the object input")
                .fontWeight(.light)
                .foregroundColor(.gray)
            
            
            HStack {
                Text("").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Button("submit", action: {
                    print("ScriptEditorView submit...")
                    
                    persistentJob()
                    submit()
                })
            
            }
        }
        .frame(width: 785.0, height: 580.0)
        .padding(.all, 20)
    }
    
    
    
    func persistentJob() -> Void {
        let fileManager = FileManager.default
        let appSupportDir = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
        let jobURL = URL(fileURLWithPath: "wf.job.\(self.job.id)", relativeTo: appSupportDir).appendingPathExtension("plist")
      
        let pl = PList()
        pl.load(fromURL: jobURL)
        
        pl.root.string(key: "type").value = "job"
        pl.root.string(key: "interpreter").value = self.job.interpreter.rawValue
        pl.root.string(key: "input").value = self.job.input.rawValue
        pl.root.string(key: "script").value = self.job.script
        pl.root.string(key: "jobId").value = self.job.id
        try? pl.save(toURL: jobURL)
        
        print("persistentJob file:\(jobURL.absoluteURL) saved")
    }
    
    
    
}

struct ScriptEditorView_Previews: PreviewProvider {
    
    @State static var job: ScriptJob = ScriptJob(id: "test", interpreter: .bash, input: .query, script: "ls -al")
    
    static var previews: some View {
        ScriptEditorView(job: $job, submit: {
            print("submit func is run...")
        })
    }
}
