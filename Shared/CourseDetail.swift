//
//  CourseDetail.swift
//  Sample-DesignCodeCourse
//
//  Created by 夏能啟 on 2020/10/22.
//

import SwiftUI

struct CourseDetail: View {
    var course: Course = courses[0]
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
            ScrollView {
                CourseItem(course: course)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height: 300)
                VStack(spacing: 16) {
                    ForEach(courseSections) { item in
                        CourseRow(item: item)
                        Divider()
                    }
                }
                .padding()
            }
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
        .edgesIgnoringSafeArea(.all)

    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseDetail(namespace: namespace)
    }
}
