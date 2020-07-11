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
        let entry = SimpleEntry(date: Date(), statistic: StatisticModel.testData)
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        URLSessionServiceClient.getStatistics { (response, error) in
            
            let newEntryDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!

            guard error == nil,
                let response = response,
                let list = response.response,
                let all = list.first(where: {$0.country == "Turkey"}) else {
                print("getStatistics error: \(error?.localizedDescription ?? "")")
                let timeline = Timeline(entries: [SimpleEntry(date: Date(), statistic: StatisticModel.testData)], policy: .after(newEntryDate))
                completion(timeline)
                return
            }
            
            print("getStatistics date: \(Date())")
            let timeline = Timeline(entries: [SimpleEntry(date: Date(), statistic: all)], policy: .after(newEntryDate))
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    let statistic: StatisticModel
}

struct PlaceholderView : View {
    var body: some View {
        ZStack {
            Color(hex: "204051")
            NewCasesView(statistic: StatisticModel.testData)
        }
    }
}

struct DailyReportEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color(hex: "204051")
            NewCasesView(statistic: entry.statistic)
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
    }
}

struct DailyReport_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            NewCasesView(statistic: StatisticModel.testData)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            NewCasesView(statistic: StatisticModel.testData)
                .previewContext(WidgetPreviewContext(family: .systemMedium))

            
            PlaceholderView()
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
