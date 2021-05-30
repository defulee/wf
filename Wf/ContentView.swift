//
//  ContentView.swift
//  Workflow
//
//  Created by defu.li on 2021/4/21.
//

import SwiftUI



struct ContentView: View {
    @EnvironmentObject var env: Env
    @State var input: String = ""
    
    @State var feedback: String = ""
    @State var currentJobType: JobType = .ListFilter
    
    @State var showAlert: Bool = false
    
    @State var contentType: ContentType = .Normal

    var body: some View {
    
        
        VStack(alignment: .leading) {
            if self.contentType == .Normal {
                if !self.env.feedback.isEmpty {
                    FeedbackView()
                }
            } else if self.contentType == .FlowList {
                FlowView()
                    .background(Color(hex: 0x333333))
            }

        }.padding()
        .background(Color.white)
        .frame(minWidth: 950)
        .environmentObject(env)
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
                
                Button(action: {
                    print("submit btn action...")
                    

                    self.showAlert.toggle()
                })  {
                    Image(systemName: "hand.point.up")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .rotationEffect(Angle(degrees: 90))
                        .frame(height: 30.0)
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Important message"),
                          message: Text(self.feedback),
                          dismissButton: .default(Text("Got it!")))
                }
                
                Divider()
                
                Button(action: {
                    print("job list btn action...")
                    self.contentType = .FlowList
                })  {
                    Image(systemName: "rectangle.3.offgrid")
                        .frame(height: 20.0)
                }
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
