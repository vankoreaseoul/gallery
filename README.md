# <img src="https://github.com/user-attachments/assets/b6c5a777-62af-42ec-b055-824f69082ae0" width="30" height="30"/> Gallery
Gallery is an iOS app which utilizes a public image API(https://picsum.photos/v2/list) to display images in both list and detail view. Users can search, apply grayscale filters to images, and perform zoom and rotation gestures.

## Development Info
* Developer: Heawon Seo
* Development Period: 03 April 2025 – 06 April 2025

## Tech Stack
### Language
![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)
### Framework
![SwiftUI](https://img.shields.io/badge/SwiftUI-0C1E2C?style=for-the-badge&logo=swift&logoColor=white)
![Combine](https://img.shields.io/badge/Combine-1C1C1E?style=for-the-badge&logo=apple&logoColor=white)
### Architecture
![MVVM](https://img.shields.io/badge/MVVM-blueviolet?style=for-the-badge)
### Library
[![Alamofire](https://img.shields.io/badge/ALAMOFIRE-EE4B2B?style=flat&logo=swift&logoColor=white)](https://github.com/Alamofire/Alamofire)
[![Kingfisher](https://img.shields.io/badge/KINGFISHER-007ACC?style=flat&logo=swift&logoColor=white)](https://github.com/onevcat/Kingfisher)
[![CoreImage](https://img.shields.io/badge/COREIMAGE-228B22?style=flat&logo=apple&logoColor=white)](https://developer.apple.com/documentation/coreimage)
[![Swinject](https://img.shields.io/badge/SWINJECT-6A5ACD?style=flat&logo=swift&logoColor=white)](https://github.com/Swinject/Swinject)
### Dependency Management
![SPM](https://img.shields.io/badge/Swift_Package_Manager-444444?style=for-the-badge&logo=swift&logoColor=white)

## UI Overview
| List | Detail |
|------------|--------|
| <img src="https://github.com/user-attachments/assets/8ad04d7c-c8bb-4cb9-a29c-902ffc9725e0" width="200"/> | <img src="https://github.com/user-attachments/assets/7b1b001d-d9c0-4dd2-861a-de68a5c96b08" width="200"/> |

## Features
* **Image Search**<br>
Search for images using filters such as id, author, width, and height.<br>
![Simulator Screen Recording - iPhone 16 - 2025-04-09 at 14 23 45](https://github.com/user-attachments/assets/1398198c-e5bc-40f8-989d-641d3b57841c)

* **Image Listing and Detail View**<br>
Display search results in a scrollable list and view selected image in detail.<br>
![Simulator Screen Recording - iPhone 16 - 2025-04-09 at 14 17 51](https://github.com/user-attachments/assets/0aa7af6d-e7bb-4497-8708-0cae6d6a98d2)

* **Black & White Filter**<br>
Apply real-time black-and-white image processing using Core Image.<br>
![Simulator Screen Recording - iPhone 16 - 2025-04-09 at 14 19 41](https://github.com/user-attachments/assets/3d4daa69-b265-4e2d-b5be-c4d2f3936626)

* **Pinch and Rotation Gestures**<br>
Zoom in/out and rotate images using multi-touch gestures (via UIKit integration).<br>
![Simulator Screen Recording - iPhone 16 - 2025-04-09 at 14 29 27](https://github.com/user-attachments/assets/d73648e2-6cdf-48cd-84dc-20b2937c5a43)

## Architecture
```
gallery
├── Data
│   ├── Model
│   │     └── Photo
│   └── Remote
│         └── PhotoApi
├── Service
│     ├── ApplyBlackAndWhiteOnPhotoService
│     ├── GetImageService
│     ├── GetPhotoListService
│     └── SearchPhotoListService
├── Usecase
│     ├── StartAppUsecase
│     ├── TurnOnOffBlackAndWhiteToggleUsecase
│     └── WriteTextOnSearchBarUsecase
├── Utils
│     ├── ApiManager
│     ├── Constant
│     └── Extension
├── View
│     ├── AlertView
│     ├── PhotoDetailView
│     ├── PhotoListCellView
│     ├── PhotoListView
│     ├── SearchBarView
│     ├── SpinnerView
│     └── ZoomAndRotateView
├── ViewModel
│     ├── PhotoDetailVM
│     ├── PhotoListCellVM
│     └── PhotoListVM
├── DependencyInjectionContainer
├── galleryApp
├── Assets
└── LaunchScreen
```

## Getting Started
### Requirements 
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

## Adopted Libraries & Purpose
|       |       |
|-------|-------|
| **Kingfisher** | Chosen for its efficient image caching capabilities. It automatically handles both memory and disk caching, reducing the need for manual cache management. |
| **Alamofire** | Used to simplify the handling of complex HTTP requests and responses. |
| **Swinject** | Selected to apply dependency injection. |
| **CoreImage** | Utilized for applying image filters, using optimized native APIs. |

