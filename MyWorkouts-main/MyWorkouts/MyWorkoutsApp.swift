
import SwiftUI
import SwiftData

@main
struct MyWorkoutsApp: App {
    var body: some Scene {
        WindowGroup {
            StartTab()
                .modelContainer(for: Activity.self)
        }
    }
}
