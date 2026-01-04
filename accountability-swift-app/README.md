# Accountability - Time Investment Tracker

A minimalist iOS app for tracking daily time investments and visualizing their compound effect over multiple time horizons.

## Design Philosophy

Inspired by Apple, Tesla, and SpaceX's design principles:
- **Monochromatic elegance**: White on black color scheme for focus and clarity
- **Single-page experience**: Everything accessible from one screen
- **Delightful interactions**: Smooth spring animations and transitions
- **Inspiring perspective**: See how daily minutes compound into years

## Features

- ⏱ **Track daily time** spent on activities (5 min to 8 hours)
- 📊 **Multiple time horizons**: View projections across:
  - Daily
  - Weekly
  - Monthly
  - Annual
  - 5-Year
  - 10-Year
- ✏️ **Full CRUD operations**: Create, read, update, and delete activities
- 💾 **Automatic persistence**: Data saves locally using UserDefaults
- 🎨 **Beautiful animations**: Spring physics and smooth transitions
- 🌑 **Dark mode**: Optimized for OLED displays

## How to Run

### Option 1: Xcode (Recommended)

1. Open **Xcode** (version 15.0 or later)
2. Select **File > New > Project**
3. Choose **iOS > App**
4. Click **Next**
5. Configure your project:
   - Product Name: `Accountability`
   - Interface: **SwiftUI**
   - Language: **Swift**
   - Storage: **None**
6. Click **Next** and choose a save location
7. **Replace** the following files with the ones from this directory:
   - `AccountabilityApp.swift` → Replace the auto-generated `[YourProjectName]App.swift`
   - `ContentView.swift` → Replace the default `ContentView.swift`
   - Add the remaining `.swift` files to your project (right-click project > Add Files)
8. Replace `Info.plist` if needed
9. Select your target device or simulator
10. Press **⌘R** to build and run

### Option 2: Swift Package Manager

1. Create a new Xcode project as above
2. Drag all `.swift` files into your project navigator
3. Build and run

### Option 3: Command Line (Development)

```bash
# Navigate to the project directory
cd accountability-swift-app

# Run in simulator (requires Xcode command line tools)
xcodebuild -scheme Accountability -destination 'platform=iOS Simulator,name=iPhone 15 Pro'
```

## Project Structure

```
accountability-swift-app/
├── AccountabilityApp.swift      # App entry point
├── ContentView.swift             # Main single-page UI
├── AddActivityView.swift         # Add new activity sheet
├── EditActivityView.swift        # Edit/delete activity sheet
├── Activity.swift                # Data model & time calculations
├── ActivityStore.swift           # State management & persistence
├── Info.plist                    # App configuration
└── README.md                     # This file
```

## Usage

1. **Add an activity**: Tap the `+` button
2. **Set daily time**: Use the slider to choose minutes per day
3. **View projections**: See how your daily investment compounds
4. **Switch time periods**: Tap the period buttons (Daily, Weekly, etc.)
5. **Edit activities**: Tap any activity card
6. **Delete activities**: Open edit view and tap "Delete Activity"

## Technical Highlights

- **SwiftUI**: Modern declarative UI framework
- **Codable**: Automatic JSON encoding/decoding for persistence
- **@StateObject/@EnvironmentObject**: Reactive state management
- **Spring animations**: Physics-based motion for natural feel
- **Continuous corners**: Rounded rectangles with smooth curves
- **Monospaced fonts**: Clean, technical typography
- **Content transitions**: Smooth numeric text animations

## Design Decisions

### Single-Page Architecture
Everything is accessible from the main screen, reducing cognitive load and navigation complexity.

### Time Horizons
Showing 10-year projections helps visualize the compound effect of daily habits - a core principle of productivity and personal growth.

### Monochromatic Theme
Black background with white/grey elements:
- Reduces eye strain
- Saves battery on OLED screens
- Creates a professional, focused aesthetic
- Directs attention to the numbers that matter

### Minimalist Input
Simple slider for time input (5 min - 8 hrs) covers most realistic daily activities without overwhelming users with precision.

## Future Enhancements

Potential features to consider:
- Historical tracking of actual time spent vs. planned
- Charts and visualizations
- Categories and tags
- Notifications and reminders
- Export data to CSV
- iCloud sync across devices
- Widgets for home screen

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## License

MIT License - Feel free to use and modify as needed.

---

Built with ♥ using SwiftUI
