import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: ActivityStore

    @State private var activityName = ""
    @State private var dailyMinutes: Double = 30
    @FocusState private var nameFieldFocused: Bool

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 0) {
                // Header
                header

                ScrollView {
                    VStack(spacing: 32) {
                        // Activity Name Input
                        nameInputSection

                        // Time Slider
                        timeSliderSection

                        // Preview
                        previewSection
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 32)
                }

                Spacer()

                // Save Button
                saveButton
            }
        }
        .onAppear {
            nameFieldFocused = true
        }
    }

    private var header: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "xmark")
                    .font(.system(size: 18, weight: .light))
                    .foregroundColor(.white.opacity(0.6))
            }

            Spacer()

            Text("NEW ACTIVITY")
                .font(.system(size: 12, weight: .medium, design: .monospaced))
                .foregroundColor(.white.opacity(0.5))
                .tracking(2)

            Spacer()

            // Invisible placeholder for symmetry
            Image(systemName: "xmark")
                .font(.system(size: 18, weight: .light))
                .opacity(0)
        }
        .padding(.horizontal, 24)
        .padding(.top, 20)
        .padding(.bottom, 16)
    }

    private var nameInputSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("ACTIVITY NAME")
                .font(.system(size: 11, weight: .medium, design: .monospaced))
                .foregroundColor(.white.opacity(0.4))
                .tracking(2)

            TextField("", text: $activityName, prompt: Text("e.g., Deep Work, Exercise, Reading").foregroundColor(.white.opacity(0.3)))
                .font(.system(size: 24, weight: .light))
                .foregroundColor(.white)
                .focused($nameFieldFocused)
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.white.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(Color.white.opacity(nameFieldFocused ? 0.3 : 0.1), lineWidth: 1)
                        )
                )
        }
    }

    private var timeSliderSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("DAILY TIME")
                    .font(.system(size: 11, weight: .medium, design: .monospaced))
                    .foregroundColor(.white.opacity(0.4))
                    .tracking(2)

                Spacer()

                Text("\(Int(dailyMinutes)) min")
                    .font(.system(size: 20, weight: .light, design: .rounded))
                    .foregroundColor(.white)
                    .contentTransition(.numericText())
            }

            Slider(value: $dailyMinutes, in: 5...480, step: 5)
                .tint(.white.opacity(0.8))
                .padding(.vertical, 8)

            HStack {
                Text("5 min")
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.white.opacity(0.3))

                Spacer()

                Text("8 hrs")
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.white.opacity(0.3))
            }
        }
    }

    private var previewSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("TIME INVESTMENT PREVIEW")
                .font(.system(size: 11, weight: .medium, design: .monospaced))
                .foregroundColor(.white.opacity(0.4))
                .tracking(2)

            VStack(spacing: 12) {
                ForEach(TimePeriod.allCases, id: \.self) { period in
                    HStack {
                        Text(period.rawValue)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white.opacity(0.6))

                        Spacer()

                        Text(formatTime(for: period))
                            .font(.system(size: 16, weight: .light, design: .rounded))
                            .foregroundColor(.white)
                            .contentTransition(.numericText())
                    }
                    .padding(.vertical, 8)
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white.opacity(0.03))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color.white.opacity(0.08), lineWidth: 1)
                    )
            )
        }
    }

    private var saveButton: some View {
        Button(action: saveActivity) {
            Text("Create Activity")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(activityName.isEmpty ? Color.white.opacity(0.2) : Color.white)
                )
        }
        .disabled(activityName.isEmpty)
        .padding(.horizontal, 24)
        .padding(.bottom, 40)
    }

    private func formatTime(for period: TimePeriod) -> String {
        let hours = (dailyMinutes * period.multiplier) / 60

        if hours < 1 {
            return String(format: "%.0f min", dailyMinutes * period.multiplier)
        } else if hours < 100 {
            return String(format: "%.1f hrs", hours)
        } else if hours < 10000 {
            return String(format: "%.0f hrs", hours)
        } else {
            return String(format: "%.1fk hrs", hours / 1000)
        }
    }

    private func saveActivity() {
        let activity = Activity(name: activityName, dailyMinutes: dailyMinutes)
        store.addActivity(activity)
        dismiss()
    }
}
