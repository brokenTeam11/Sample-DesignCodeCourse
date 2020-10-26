//
//  ContentView.swift
//  Shared
//
//  Created by 夏能啟 on 2020/10/20.
//

import SwiftUI

struct ContentView: View {
    // 设置环境变量
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            CourseView()
        } else {
            CourseView()
        }
        
        #else
        SideBar()
            .frame(minWidth: 1000, minHeight: 600)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
