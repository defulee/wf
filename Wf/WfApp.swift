//
//  WorkflowApp.swift
//  Workflow
//
//  Created by defu.li on 2021/4/21.
//

import SwiftUI

@main
struct WfApp: App {
    @StateObject private var env = Env()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(env)
        }
        //设置隐藏标题栏风格
        .windowStyle(HiddenTitleBarWindowStyle())
        
    }
}
