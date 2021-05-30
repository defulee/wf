//
//  ListItem.swift
//  wf
//
//  Created by defu.li on 2021/5/30.
//

import Foundation

import SwiftUI
import CoreLocation

struct ListItem: Hashable, Codable, Identifiable {
    var id: Int
    var content: String
    var desc: String
    var arg: String
   

    private var imageName: String
    var image: Image {
//        if imageName.isEmpty {
//            return Image(systemName: "photo")
//        } else {
//            return Image(imageName)
//        }
        Image(systemName: "photo")
    }
   
    init(id: Int = -1, content: String, desc: String = "", arg: String, imageName: String = "") {
        self.id = id
        self.content = content
        self.desc = desc
        self.arg = arg
        self.imageName = imageName
    }
}
