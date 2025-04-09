# <img src="https://github.com/user-attachments/assets/b6c5a777-62af-42ec-b055-824f69082ae0" width="30" height="30"/> Gallery
Gallery is an iOS app which utilizes a public image API(https://picsum.photos/v2/list) to display images in both list and detail view. Users can search, apply grayscale filters to images, and perform zoom and rotation gestures.

## Getting Started
### Requirements ###
* **Xcode 15 or later**
<br>The project leverages the latest Swift and SwiftUI features, including improved NavigationStack, navigationDestination, and enhanced developer tools available in Xcode 15.

* **iOS 16.0 or later**
<br>The app uses several SwiftUI APIs that are only available in iOS 16 and above, such as NavigationStack, which replaces the deprecated NavigationView.<br><br>

To run this project locally, follow these steps:
1. **Clone the repository**
   ```bash
   git clone https://github.com/vankoreaseoul/gallery.git

2. **Open the project in Xcode**
<br>Open gallery.xcodeproj or gallery.xcworkspace in Xcode.

4. **Resolve Swift Package Dependencies**
<br>Xcode will automatically fetch the dependencies via Swift Package Manager.
<br>If not, go to File → Packages → Resolve Package Versions or press Cmd + Shift + K.

6. **Build and run the app**
<br>Select a simulator or your device, then press Cmd + R to build and launch the app.
