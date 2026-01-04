import SwiftUI

// Preview helpers for development
#Preview("Main View - Empty") {
    ContentView()
        .environmentObject(ActivityStore())
        .preferredColorScheme(.dark)
}

#Preview("Main View - With Activities") {
    let store = ActivityStore()
    store.activities = [
        Activity(name: "Deep Work", dailyMinutes: 120),
        Activity(name: "Exercise", dailyMinutes: 60),
        Activity(name: "Reading", dailyMinutes: 30),
        Activity(name: "Meditation", dailyMinutes: 20)
    ]

    return ContentView()
        .environmentObject(store)
        .preferredColorScheme(.dark)
}

#Preview("Add Activity") {
    AddActivityView()
        .environmentObject(ActivityStore())
        .preferredColorScheme(.dark)
}

#Preview("Edit Activity") {
    let activity = Activity(name: "Deep Work", dailyMinutes: 120)

    return EditActivityView(activity: activity)
        .environmentObject(ActivityStore())
        .preferredColorScheme(.dark)
}
