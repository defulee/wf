//
//  WorkflowApp.swift
//  Workflow
//
//  Created by defu.li on 2021/4/21.
//

import SwiftUI

@main
struct WfApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        //设置隐藏标题栏风格
        .windowStyle(HiddenTitleBarWindowStyle())
        
    }
}
