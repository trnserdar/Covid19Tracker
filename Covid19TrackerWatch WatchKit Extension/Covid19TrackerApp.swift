//
//  Covid19TrackerApp.swift
//  Covid19TrackerWatch WatchKit Extension
//
//  Created by Serdar Turan on 19.07.2020.
//

import SwiftUI

@main
struct Covid19TrackerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                StatisticView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
