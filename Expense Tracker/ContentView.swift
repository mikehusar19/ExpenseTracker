//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Husar Michael on 14.02.25.
//

import SwiftUI

struct ContentView: View {
    // Intro Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    //Active Tab
    @State private var activeTab: Tab = .recents
    var body: some View {
        TabView(selection: $activeTab) {
            Text("Recents")
                .tag(Tab.recents)
                .tabItem { Tab.recents.tabContent }
            Text("Search")
                .tag(Tab.search)
                .tabItem { Tab.search.tabContent }
            Text("Chart")
                .tag(Tab.charts)
                .tabItem { Tab.charts.tabContent }
            Text("Settings")
                .tag(Tab.settings)
                .tabItem { Tab.settings.tabContent }
        }
        .sheet(isPresented: $isFirstTime, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    ContentView()
}
