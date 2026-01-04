# Quick Start Guide

## Fastest Way to Run This App

### 1. Create Xcode Project (2 minutes)

1. Open **Xcode**
2. File → New → Project
3. Choose **iOS** → **App** → Next
4. Settings:
   - Product Name: `Accountability`
   - Interface: **SwiftUI** ✓
   - Language: **Swift** ✓
   - Click **Next**
5. Save anywhere you like

### 2. Add the Files (1 minute)

**Delete** these auto-generated files:
- `AccountabilityApp.swift` (if it has a different name)
- `ContentView.swift`

**Drag and drop** these files into your Xcode project:
- ✅ `AccountabilityApp.swift`
- ✅ `ContentView.swift`
- ✅ `AddActivityView.swift`
- ✅ `EditActivityView.swift`
- ✅ `Activity.swift`
- ✅ `ActivityStore.swift`
- ✅ `Preview.swift` (optional, for development)

When prompted, choose:
- ✓ Copy items if needed
- ✓ Create groups
- ✓ Add to target: Accountability

### 3. Run the App (30 seconds)

1. Select a simulator: **iPhone 15 Pro** (or any iPhone)
2. Press **⌘R** or click the ▶️ Play button
3. Wait for build to complete
4. **Done!** 🎉

## What You'll See

- A beautiful black screen with "ACCOUNTABILITY" header
- "No activities tracked yet" message
- Tap the **+** button to add your first activity
- Try adding:
  - "Deep Work" - 120 min
  - "Exercise" - 60 min
  - "Reading" - 30 min

## Using the App

### Add Activity
1. Tap **+** button
2. Enter activity name
3. Drag slider to set daily minutes
4. See preview of time horizons
5. Tap "Create Activity"

### View Time Horizons
- Tap **Daily**, **Weekly**, **Monthly**, etc.
- Numbers update with smooth animations
- See total at bottom

### Edit Activity
1. Tap any activity card
2. Change name or time
3. Tap "Save Changes"

### Delete Activity
1. Tap activity card
2. Scroll down
3. Tap "Delete Activity"
4. Confirm

## Troubleshooting

### Build Errors?
- Make sure **all 6 .swift files** are in the project
- Check that target is selected (checkbox next to file)
- Clean build folder: Shift+⌘+K, then ⌘+B

### Simulator Issues?
- Try different simulator: iPhone 15, iPhone 14 Pro
- Restart simulator: Device → Restart

### Files Not Found?
- Right-click project in navigator
- Add Files to "Accountability"
- Select all .swift files

## Tips

- **Xcode 15+** required (uses latest SwiftUI features)
- **iOS 17+** deployment target
- Works on iPhone and iPad
- Portrait orientation recommended

## Next Steps

Once running, try:
1. Add 3-5 activities you do daily
2. Switch between time horizons
3. Notice how daily minutes compound over 10 years
4. Use this to stay accountable to your goals!

---

Need help? Check README.md for detailed information.
