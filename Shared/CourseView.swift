//
//  CourseView.swift
//  Sample-DesignCodeCourse
//
//  Created by 夏能啟 on 2020/10/21.
//

import SwiftUI

struct CourseView: View {
    @State var show = false
    @Namespace var namespace
    @State var selectedItem: Course? = nil
    @State var isDisabled = false

    var body: some View {
        ZStack {
            ScrollView {
                // layout布局
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 160), spacing: 16)
                    ],
                    spacing: 16)
                {
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                .frame(height: 200)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) { // 建议使用`withAnimation`，来添加点击动效，有更好的过渡，不会造成拖拽拖影
                                        show.toggle()
                                        selectedItem = item
                                        isDisabled = true
                                    }
                                }
                                .disabled(isDisabled)
                        }
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
            }
            .zIndex(1)
            if selectedItem != nil {
                ZStack(alignment: .topTrailing) {
                    VStack {
                        ScrollView {
                            CourseItem(course: selectedItem!)
                                .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                                .frame(height: 300)
                            VStack(spacing: 16) {
                                ForEach(0 ..< 20) { _ in
                                    CourseRow()
                                }
                            }
                            .padding()
                        }
                    }
                    .background(Color("Background 1"))
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .matchedGeometryEffect(id: "container\(selectedItem!.id)", in: namespace)
                    .edgesIgnoringSafeArea(.all)
                    
                    
                    CloseButton()
                        .padding(.trailing, 16)
                        .onTapGesture {
                            withAnimation(.spring()) { // 建议使用`withAnimation`，来添加点击动效，有更好的过渡，不会造成拖拽拖影
                                show.toggle()
                                selectedItem = nil
                                // 设置动画延迟, 延迟时间结束才能运行此代码
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    isDisabled = false
                                }
                            }
                        }
                }
                .zIndex(2)
            }
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
