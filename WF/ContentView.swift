//
//  ContentView.swift
//  Workflow
//
//  Created by defu.li on 2021/4/21.
//

import SwiftUI



struct ContentView: View {
    @State var input: String = ""
    @State var text: String = ""

    var body: some View {
    
        
        VStack(alignment: .leading) {
           
//            MultiTextEditorView()
//
//            Divider()

            FlowView()
                .background(Color(hex: 0x333333))

        }.padding()
        .background(Color.white)
        .frame(minWidth: 950)
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
                })  {
                    Image(systemName: "hand.point.up")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .rotationEffect(Angle(degrees: 90))
                        .frame(height: 30.0)
                }
                
                Divider()
                
                Button(action: {
                    print("job list btn action...")
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
