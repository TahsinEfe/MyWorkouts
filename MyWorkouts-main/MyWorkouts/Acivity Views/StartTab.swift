//
//  StartTab.swift
//  MyWorkouts
//
//  Created by Intala Lab on 1.04.2024.
//

import SwiftUI
import SwiftData

struct StartTab: View {
    var body: some View {
        TabView {
            ActivityListView()
                .tabItem {
                    Label("Activities", systemImage: "figure.mixed.cardio")
                }
            CalendarHeader()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            
        }
    }
}

#Preview {
    StartTab()
        .modelContainer(Activity.preview)
}
