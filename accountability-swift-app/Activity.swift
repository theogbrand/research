import Foundation

struct Activity: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var dailyMinutes: Double
    var color: String
    var createdAt: Date

    init(id: UUID = UUID(), name: String, dailyMinutes: Double, color: String = "white", createdAt: Date = Date()) {
        self.id = id
        self.name = name
        self.dailyMinutes = dailyMinutes
        self.color = color
        self.createdAt = createdAt
    }

    // Time horizon calculations
    var weeklyHours: Double {
        (dailyMinutes * 7) / 60
    }

    var monthlyHours: Double {
        (dailyMinutes * 30) / 60
    }

    var annualHours: Double {
        (dailyMinutes * 365) / 60
    }

    var fiveYearHours: Double {
        (dailyMinutes * 365 * 5) / 60
    }

    var tenYearHours: Double {
        (dailyMinutes * 365 * 10) / 60
    }

    // Formatted strings for display
    func formattedTime(for period: TimePeriod) -> String {
        let hours: Double
        switch period {
        case .daily:
            hours = dailyMinutes / 60
        case .weekly:
            hours = weeklyHours
        case .monthly:
            hours = monthlyHours
        case .annual:
            hours = annualHours
        case .fiveYear:
            hours = fiveYearHours
        case .tenYear:
            hours = tenYearHours
        }

        if hours < 1 {
            return String(format: "%.0f min", dailyMinutes)
        } else if hours < 100 {
            return String(format: "%.1f hrs", hours)
        } else {
            return String(format: "%.0f hrs", hours)
        }
    }
}

enum TimePeriod: String, CaseIterable {
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
    case annual = "Annual"
    case fiveYear = "5 Year"
    case tenYear = "10 Year"

    var multiplier: Double {
        switch self {
        case .daily: return 1
        case .weekly: return 7
        case .monthly: return 30
        case .annual: return 365
        case .fiveYear: return 365 * 5
        case .tenYear: return 365 * 10
        }
    }
}
