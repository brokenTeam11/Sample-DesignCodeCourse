//
//  CourseView.swift
//  Sample-DesignCodeCourse
//
//  Created by 夏能啟 on 2020/10/21.
//

import SwiftUI

struct CourseView: View {
    var body: some View {
        List(0 ..< 20) { item in
            CourseRow()
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Courses")
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
