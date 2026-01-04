import Foundation
import SwiftUI

class ActivityStore: ObservableObject {
    @Published var activities: [Activity] = []

    private let saveKey = "SavedActivities"

    init() {
        loadActivities()
    }

    func addActivity(_ activity: Activity) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
            activities.append(activity)
        }
        saveActivities()
    }

    func updateActivity(_ activity: Activity) {
        if let index = activities.firstIndex(where: { $0.id == activity.id }) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                activities[index] = activity
            }
            saveActivities()
        }
    }

    func deleteActivity(_ activity: Activity) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
            activities.removeAll { $0.id == activity.id }
        }
        saveActivities()
    }

    func totalTime(for period: TimePeriod) -> Double {
        let totalMinutes = activities.reduce(0) { $0 + $1.dailyMinutes }
        return (totalMinutes * period.multiplier) / 60
    }

    private func saveActivities() {
        if let encoded = try? JSONEncoder().encode(activities) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }

    private func loadActivities() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([Activity].self, from: data) {
            activities = decoded
        }
    }
}
