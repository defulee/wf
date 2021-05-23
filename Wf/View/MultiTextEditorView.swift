//
//  ContentView.swift
//  Workflow
//
//  Created by defu.li on 2021/4/21.
//

import SwiftUI


struct MultiTextEditorView: View {
    @State var input: String = ""
    @State var text: String = ""
    
    @State private var filter = FilterColumn.one

    enum FilterColumn: String, CaseIterable, Identifiable {
        case one = "One"
        case two = "Two"
        case three = "Three"

        var id: FilterColumn { self }
    }

    var body: some View {
     
        VStack(alignment: .leading) {  
            HSplitView(){
                TextEditor(text: $input)
                    .lineSpacing(3)
                    .font(.body)
                    .disableAutocorrection(true)
                    .border(Color.gray)
                    
                if filter != FilterColumn.one {
                    TextEditor(text: $text)
                        .lineSpacing(3)
                        .font(.body)
                        .disableAutocorrection(true)
                        .border(Color.gray)
                }
                if filter == FilterColumn.three {
                    TextEditor(text: $text)
                        .lineSpacing(3)
                        .font(.body)
                        .disableAutocorrection(true)
                        .border(Color.gray)
                }
            }
            .lineSpacing(0)
            .padding(.all, 10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
            
        }
        .padding()
        .background(Color.white)
//        .toolbar(content: {
//            ToolbarItem {
//                Menu {
//                    Picker("Column", selection: $filter) {
//                        ForEach(FilterColumn.allCases) { column in
//                            Text(column.rawValue).tag(column)
//                        }
//                    }
//                    .pickerStyle(InlinePickerStyle())
//                } label: {                    
//                    Label("Filter", systemImage: "rectangle.split.3x1")
//                }
//            }
//        })
    }
}


struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        MultiTextEditorView()
    }
}
