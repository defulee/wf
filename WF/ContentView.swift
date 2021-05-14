//
//  ContentView.swift
//  Workflow
//
//  Created by defu.li on 2021/4/21.
//

import SwiftUI

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
            get { .none }
            set { }
    }
}

struct ContentView: View {
    @State var input: String = ""
    @State var text: String = ""

    var body: some View {
    
        
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20.0, height: 20.0)
            
                TextField("Search", text: $input)
                    .font(.title)
                    .textFieldStyle(PlainTextFieldStyle())
                
                Button("submit", action: {
                    print("submit btn action...")
                    let bash = Bash()
                    let files = try? bash.run(commandName: "ls", arguments: ["-la", "~/Desktop"])
                    print(files)
                    
                    if let lsOutput = try? bash.run(commandName: "ls", arguments: []) { print(lsOutput) }
                    if let output = try? bash.run(commandName: "ls", arguments: ["-la"]) { print(output)}
                    
                    // file:///Users/defu/Library/Containers/com.defu.Wf/Data/Documents/test.txt
                    // let file = FileHelper()
                    // file.write(fileName: "test", data: "submit btn action...")
                }).frame(height: 40.0)
            }
            .frame(height: 30)
          
            Divider()
            
            MultiTextEditorView()
            
            Divider()

            FlowView()

        }.padding()
        .background(Color.white)
        .toolbar(content: {
            HStack(alignment: .center) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20.0, height: 20.0)
            
                VStack {
                    TextField("Search", text: $input)
                        .font(.title)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(width: 680)
                    
                    Divider()
                        .frame(width: 680)
                }
                
//                Button("submit", action: {
//                    print("submit btn action...")
//                })
//                .frame(height: 40.0)
                Image(systemName: "terminal.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 30.0)
                    .onTapGesture(count: 1, perform: {
                        print("submit btn onTapGesture...")
                    })
            }
            .frame(height: 30)
             
        })
    }
  
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
