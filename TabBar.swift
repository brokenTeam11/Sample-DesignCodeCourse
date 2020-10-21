//
//  TabBar.swift
//  Sample-DesignCodeCourse (iOS)
//
//  Created by 夏能啟 on 2020/10/22.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            NavigationView {
                CourseView()
            }
            .tabItem {
                Image(systemName: "book.closed")
                Text("Courses")
            }
            
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Tutorials")
            }
            
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "tv")
                Text("Livestreams")
            }
            
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "mail.stack")
                Text("Certificates")
            }
            
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
