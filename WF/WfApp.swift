//
//  WorkflowApp.swift
//  Workflow
//
//  Created by defu.li on 2021/4/21.
//

import SwiftUI

@main
struct WfApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //设置隐藏标题栏风格
        .windowStyle(HiddenTitleBarWindowStyle())
        
    }
}
