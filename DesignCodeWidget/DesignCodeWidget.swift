//
//  DesignCodeWidget.swift
//  DesignCodeWidget
//
//  Created by 夏能啟 on 2020/10/26.
//

import Intents
import SwiftUI
import WidgetKit

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct DesignCodeWidgetEntryView: View {
    var entry: Provider.Entry
    // 设置环境变量
    @Environment(\.widgetFamily) var family

    var body: some View {
//        Text(entry.date, style: .time)
        // 设置条件
        if family == .systemSmall {
            DesignCodeWidgetSmall()
        } else {
            DesignCodeWidgetMedium()
        }
    }
}

// 创建小号的组件
struct DesignCodeWidgetSmall: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Newest")
                .font(Font.footnote.smallCaps())
//                .foregroundColor(.secondary)

            Text("Matched Geometry Effect")
                .font(.subheadline)
                .fontWeight(.semibold)

            Text("这是测试文本")
                .font(.footnote)
//                .foregroundColor(.secondary)
        }
        .padding(12)
    }
}

// 创建中号的组件
struct DesignCodeWidgetMedium: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Newest")
                .font(Font.footnote.smallCaps())
//                .foregroundColor(.secondary)
            ForEach(courseSections.indices) { index in // indices是索引，类似JavaScript的index
                if index < 2 {
                    CourseRow(item: courseSections[index])
                }
            }
        }
        .padding(12)
    }
}

@main
struct DesignCodeWidget: Widget {
    let kind: String = "DesignCodeWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            DesignCodeWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("我的测试小组件")
        .description("测试小组件.")
        // 这里放置各种大小的小组件
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct DesignCodeWidget_Previews: PreviewProvider {
    static var previews: some View {
        DesignCodeWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            //  .previewContext(WidgetPreviewContext(family: .systemSmall)) // 小号组件
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
