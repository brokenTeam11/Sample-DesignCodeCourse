//
//  CourseSectionDetail.swift
//  Sample-DesignCodeCourse
//
//  Created by 夏能啟 on 2020/10/26.
//

import SwiftUI

struct CourseSectionDetail: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        #if os(iOS)
        content
        #else
        content
            .frame(width: 800, height: 600)
        #endif
    }
    
    var content: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                CourseItem(cornerRadius: 0)
                    .frame(height: 300)
                VStack(alignment: .leading, spacing: 30) {
                    Text("这是一段测试文本")
                    Text("这是一段测试文本")
                    Text("这是一段测试文本")
                    Text("这是一段测试文本")
                    Text("这是一段测试文本")
                    Text("这是一段测试文本")
                }
                .padding()
            }
            
            CloseButton()
                .padding()
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
        
    }
}

struct CourseSectionDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseSectionDetail()
    }
}
