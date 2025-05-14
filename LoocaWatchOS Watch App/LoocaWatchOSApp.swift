//
//  LoocaWatchOSApp.swift
//  LoocaWatchOS Watch App
//
//  Created by FWZ on 13/05/25.
//

import SwiftUI

@main
struct LoocaWatchOS_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
