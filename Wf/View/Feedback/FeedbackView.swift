//
//  FeedbackView.swift
//  wf
//
//  Created by defu.li on 2021/5/29.
//

import SwiftUI

struct FeedbackView: View {
    @EnvironmentObject var env: Env
    
    
    var body: some View {
        if env.currentJobType == .ListFilter {
            ListSelectView(data: env.feedback)
        } else {
            MultiTextEditorView()
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    
    @StateObject private static var env = Env()
    
    static var previews: some View {
        FeedbackView().environmentObject(env)
    }
}
