//
//  DailyReport.swift
//  DailyReport
//
//  Created by Serdar Turan on 8.07.2020.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry

    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), statistics: [StatisticModel.testData])
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        URLSessionServiceClient.getStatistics { (response, error) in
            
            let newEntryDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!

            guard error == nil,
                let response = response,
                let list = response.response else {
                print("getStatistics error: \(error?.localizedDescription ?? "")")
                let timeline = Timeline(entries: [SimpleEntry(date: Date(), statistics: [StatisticModel.testData])], policy: .after(newEntryDate))
                completion(timeline)
                return
            }
            
            print("getStatistics date: \(Date())")
            let timeline = Timeline(entries: [SimpleEntry(date: Date(), statistics: list)], policy: .after(newEntryDate))
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    let statistics: [StatisticModel]
}

struct PlaceholderView : View {
    var body: some View {
        ZStack {
            Color(hex: "204051")
            NewCasesSmallView(statistic: StatisticModel.testData)
        }
    }
}

struct DailyReportEntryView : View {
    
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        
        switch family {
        case .systemSmall:
            
            ZStack {
                Color.dateColor
                NewCasesSmallView(statistic: entry.statistics.first(where: {$0.country == "Turkey"}) ?? StatisticModel.testData)
            }
            
        case .systemMedium:
            
            ZStack {
                Color.dateColor
                NewCasesMediumView(statistic: entry.statistics.first(where: {$0.country == "Turkey"}) ?? StatisticModel.testData)
            }
            
        case .systemLarge:
            
            ZStack {
                Color.dateColor
                NewCasesLargeView(statistic: entry.statistics.first(where: {$0.country == "Turkey"}) ?? StatisticModel.testData, statisticWorld: entry.statistics.first(where: {$0.country == "All"}))
            }
            
        default:
            EmptyView()
        }
    }
}

@main
struct DailyReport: Widget {
    private let kind: String = "DailyReport"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            DailyReportEntryView(entry: entry)
        }
        .configurationDisplayName("Covid19 Daily Tracker")
        .description("Shows daily Covid19 numbers.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct DailyReport_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            NewCasesSmallView(statistic: StatisticModel.testData)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            NewCasesMediumView(statistic: StatisticModel.testData)
                .previewContext(WidgetPreviewContext(family: .systemMedium))

            NewCasesLargeView(statistic: StatisticModel.testData, statisticWorld: StatisticModel.testData)
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
