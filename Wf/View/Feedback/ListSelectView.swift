//
//  ListSelectView.swift
//  wf
//
//  Created by defu.li on 2021/5/29.
//

import SwiftUI

struct ListSelectView: View {
    
    @State private var selectedItem: ListItem?
    
    var data: String = "[]"
    
    var body: some View {
        let items: [ListItem] = decode(data: data)
            
        List(selection: $selectedItem) {
            ForEach(items) { item in
                ListItemView(item: item)
                    .background(self.selectedItem?.id == item.id ? Color.gray : Color.clear)
                    .onTapGesture(count: 1, perform: {
                        self.selectedItem = item
                    })
                Text("\(self.selectedItem?.id ?? 0)")
                Divider()
            }
        }
        .frame(minWidth: 300)
        
//        Text(self.selectedItem?.id ?? "")
    }
    

//        var index: Int? {
//            modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
//        }

    
    
    func decode<T: Decodable>(data: String) -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data.data(using: .utf8)!)
        } catch {
            fatalError("Couldn't decode \(data) as \(T.self):\n\(error)")
        }
    }
}

struct ListSelectView_Previews: PreviewProvider {
    @StateObject private static var env = Env()
    
    static var previews: some View {
        ListSelectView(data: env.feedback)
    }
}
