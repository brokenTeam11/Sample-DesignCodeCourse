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
                VStack(spacing: 20) {
                    ForEach(courses) { item in
                        CourseItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(width: 335, height: 250)
                            .onTapGesture {
                                withAnimation(.spring()) { // 建议使用`withAnimation`，来添加点击动效，有更好的过渡，不会造成拖拽拖影
                                    show.toggle()
                                    selectedItem = item
                                    isDisabled = true
                                }
                            }
                            .disabled(isDisabled)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            if selectedItem != nil {
                ScrollView {
                    CourseItem(course: selectedItem!)
                        .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                        .frame(height: 300)
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
                    VStack(spacing: 16) {
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                    
                }
                .background(Color("Background 1"))
                .transition(
                    .asymmetric(
                        insertion: AnyTransition
                                    .opacity
                                    .animation(
                                        Animation.spring().delay(0.3)),
                        removal: AnyTransition
                                    .opacity
                                    .animation(.spring())
                    )
                )
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
