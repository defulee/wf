//
//  ListSelectItem.swift
//  wf
//
//  Created by defu.li on 2021/5/29.
//


import SwiftUI

struct ListItemView: View {
    var item: ListItem

    var body: some View {
        HStack {
            Image(systemName: "photo")
                .resizable()
                .frame(width: 36, height: 36)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(item.content)
                    .bold()
                Text(item.desc)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
//        .padding(.vertical, 4)
    }
}

struct ListItemView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            ListItemView(item: ListItem(content: "Content1", desc: "Desc1", arg: "c1"))
            ListItemView(item: ListItem(content: "Content2", desc: "Desc2", arg: "c2"))
        }
        .previewLayout(.fixed(width: 300, height: 40))
    }
}
