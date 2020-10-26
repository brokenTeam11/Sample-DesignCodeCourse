//
//  LibraryContent.swift
//  Sample-DesignCodeCourse
//
//  Created by 夏能啟 on 2020/10/26.
//

import SwiftUI

// 创建可以和Xcode自带的组件一起使用的组件
struct LibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(
            CloseButton(),
            title: "Close Button View",
            category: .control
        )
    }
    
    @LibraryContentBuilder
    func modifiers(base: Image) -> [LibraryItem] {
        LibraryItem(
            base.cardStyle(color: Color.blue, cornerRadius: 22),
            title: "Card Style",
            category: .effect
        )
    }
}

extension View {
    func cardStyle(color: Color, cornerRadius: CGFloat) -> some View {
        return self
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(color: color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}
