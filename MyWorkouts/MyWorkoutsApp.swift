
import SwiftUI
import SwiftData

@main
struct MyWorkoutsApp: App {
    var body: some Scene {
        WindowGroup {
            ActivityListView()
                .modelContainer(for: Activity.self)
        }
    }
}
