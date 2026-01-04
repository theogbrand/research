import SwiftUI

@main
struct AccountabilityApp: App {
    @StateObject private var store = ActivityStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .preferredColorScheme(.dark)
        }
    }
}
