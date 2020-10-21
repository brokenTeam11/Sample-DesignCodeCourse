//
//  CourseRow.swift
//  Sample-DesignCodeCourse
//
//  Created by 夏能啟 on 2020/10/21.
//

import SwiftUI

struct CourseRow: View {
    var item: CourseSection = courseSections[0]
    
    var body: some View {
        HStack(alignment: .top) {
            Image(item.logo)
                .renderingMode(.original) // 多色模式
                .frame(width: 48.0, height: 48.0)
                .imageScale(.medium)
                .background(item.color)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 4.0) {
                Text(item.title)
                    .font(.subheadline)
                    .bold()
                Text(item.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
    }
}
