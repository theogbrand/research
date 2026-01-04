import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: ActivityStore
    @State private var showingAddActivity = false
    @State private var selectedPeriod: TimePeriod = .daily

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 0) {
                // Header
                headerView

                // Period Selector
                periodSelector

                // Activities List
                if store.activities.isEmpty {
                    emptyStateView
                } else {
                    activitiesListView
                }

                Spacer()

                // Total Time Summary
                totalTimeSummary

                // Add Button
                addButton
            }
        }
        .sheet(isPresented: $showingAddActivity) {
            AddActivityView()
        }
    }

    private var headerView: some View {
        VStack(spacing: 8) {
            Text("ACCOUNTABILITY")
                .font(.system(size: 14, weight: .medium, design: .monospaced))
                .foregroundColor(.white.opacity(0.5))
                .tracking(3)

            Text("Time Investment")
                .font(.system(size: 32, weight: .thin))
                .foregroundColor(.white)
        }
        .padding(.top, 60)
        .padding(.bottom, 30)
    }

    private var periodSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(TimePeriod.allCases, id: \.self) { period in
                    PeriodButton(
                        period: period,
                        isSelected: selectedPeriod == period,
                        action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                selectedPeriod = period
                            }
                        }
                    )
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.bottom, 20)
    }

    private var activitiesListView: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(store.activities) { activity in
                    ActivityRow(activity: activity, period: selectedPeriod)
                        .transition(.asymmetric(
                            insertion: .scale.combined(with: .opacity),
                            removal: .scale.combined(with: .opacity)
                        ))
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 100)
        }
    }

    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Image(systemName: "clock.fill")
                .font(.system(size: 60, weight: .ultraLight))
                .foregroundColor(.white.opacity(0.2))

            Text("No activities tracked yet")
                .font(.system(size: 18, weight: .light))
                .foregroundColor(.white.opacity(0.4))

            Text("Tap + to start tracking your time")
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.white.opacity(0.3))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 100)
    }

    private var totalTimeSummary: some View {
        VStack(spacing: 8) {
            Text("TOTAL \(selectedPeriod.rawValue.uppercased())")
                .font(.system(size: 11, weight: .medium, design: .monospaced))
                .foregroundColor(.white.opacity(0.4))
                .tracking(2)

            Text(formatTotalTime(store.totalTime(for: selectedPeriod)))
                .font(.system(size: 48, weight: .ultraLight, design: .rounded))
                .foregroundColor(.white)
                .contentTransition(.numericText())
        }
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.03))
    }

    private var addButton: some View {
        Button(action: {
            showingAddActivity = true
        }) {
            Image(systemName: "plus")
                .font(.system(size: 24, weight: .light))
                .foregroundColor(.white)
                .frame(width: 64, height: 64)
                .background(
                    Circle()
                        .fill(Color.white.opacity(0.1))
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        )
                )
        }
        .padding(.bottom, 40)
    }

    private func formatTotalTime(_ hours: Double) -> String {
        if hours < 1 {
            return String(format: "%.0f min", hours * 60)
        } else if hours < 100 {
            return String(format: "%.1f hrs", hours)
        } else {
            return String(format: "%.0f hrs", hours)
        }
    }
}

struct PeriodButton: View {
    let period: TimePeriod
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(period.rawValue)
                .font(.system(size: 13, weight: isSelected ? .medium : .regular, design: .rounded))
                .foregroundColor(isSelected ? .black : .white.opacity(0.6))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(isSelected ? Color.white : Color.white.opacity(0.08))
                )
                .overlay(
                    Capsule()
                        .stroke(Color.white.opacity(isSelected ? 0 : 0.15), lineWidth: 1)
                )
        }
    }
}

struct ActivityRow: View {
    @EnvironmentObject var store: ActivityStore
    let activity: Activity
    let period: TimePeriod
    @State private var showingEdit = false

    var body: some View {
        Button(action: {
            showingEdit = true
        }) {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(activity.name)
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.white)

                    Text("\(Int(activity.dailyMinutes)) min/day")
                        .font(.system(size: 13, weight: .light, design: .monospaced))
                        .foregroundColor(.white.opacity(0.4))
                }

                Spacer()

                Text(activity.formattedTime(for: period))
                    .font(.system(size: 24, weight: .ultraLight, design: .rounded))
                    .foregroundColor(.white)
                    .contentTransition(.numericText())
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color.white.opacity(0.1), lineWidth: 1)
                    )
            )
        }
        .sheet(isPresented: $showingEdit) {
            EditActivityView(activity: activity)
        }
    }
}
