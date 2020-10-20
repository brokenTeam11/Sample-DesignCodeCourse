//
//  SideBar.swift
//  Sample-DesignCodeCourse
//
//  Created by 夏能啟 on 2020/10/21.
//

import SwiftUI

struct SideBar: View {
    var body: some View {
        NavigationView {
                List {
                    NavigationLink(destination: CourseView()) {
                        Label("Course", systemImage: "book.closed")
                    }
                    Label("Tutorials", systemImage: "list.bullet.rectangle")
                    Label("Livestreams", systemImage: "tv")
                    Label("Certificates", systemImage: "mail.stack")
                    Label("Search", systemImage: "magnifyingglass")
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Learn")
                
                CourseView()
        }
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
