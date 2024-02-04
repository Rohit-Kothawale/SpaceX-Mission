# SpaceX-Mission

An iOS application using `SwiftUI` and `MVVM` architectural pattern that queries the `SpaceX` data API to list all historical launches and displays extensive launch details to the user.

## Features

- List of all historical launches with summary details
  - Mission Name
  - Rocket Name
  - Launch Site Name
  - Date of Launch
  - Launch patch image or default image when not provided by the API
- Clickable launch items with the ability to view full mission details

## Screenshots

### iPhone Portrait

<img src="https://github.com/Rohit-Kothawale/SpaceX-Mission/assets/124340248/e7aebcd5-609d-4138-8d9f-a3892948e5d2" alt="iPad-Landscape" width="330"/> 
<img src="https://github.com/Rohit-Kothawale/SpaceX-Mission/assets/124340248/78338a8e-36cf-4ccc-b221-f1b34f2787c3" alt="iPad-Landscape" width="330"/> 
<img src="https://github.com/Rohit-Kothawale/SpaceX-Mission/assets/124340248/bb49d619-d76d-40a8-87e0-15bf5e75448a" alt="iPad-Landscape" width="330"/> 
<img src="https://github.com/Rohit-Kothawale/SpaceX-Mission/assets/124340248/064b5a5f-96dd-4bf1-aa10-4798145c2a59" alt="iPad-Landscape" width="330"/>

### iPhone Landscape

<img src="https://github.com/Rohit-Kothawale/SpaceX-Mission/assets/124340248/a4205272-6b36-462a-9869-ed5fefe41bed" alt="iPad-Landscape" width="500"/> 
<img src="https://github.com/Rohit-Kothawale/SpaceX-Mission/assets/124340248/83f6d849-af88-4cdc-ab1f-a75b91e49674" alt="iPad-Landscape" width="500"/> 
<img src="https://github.com/Rohit-Kothawale/SpaceX-Mission/assets/124340248/2c4250b1-f71d-43a1-8135-6664364bbf68" alt="iPad-Landscape" width="500"/> 
<img src="https://github.com/Rohit-Kothawale/SpaceX-Mission/assets/124340248/6a5743ab-515a-4338-9ad5-108f777a8b5a" alt="iPad-Landscape" width="500"/> 

### iPad Portrait

<img src="https://github.com/Rohit-Kothawale/SpaceX-Mission/assets/124340248/7a0301dc-804b-469a-85b7-63f7cd1f1202" alt="iPad-Landscape" width="370"/> 

### iPad Landscape

<img src="https://github.com/Rohit-Kothawale/SpaceX-Mission/assets/124340248/da587bb7-b732-4a4e-8b99-3b205773acda" alt="iPad-Landscape" width="550"/> 

## Getting Started

To get started with the SpaceX-Mission iOS application, follow these steps:

1. Clone the repository:
   ```bash
     git clone https://github.com/your-username/SpaceX-Mission-iOS.git
   ```
2. Change the directory:
   ```bash
    cd SpaceX-Mission-iOS
   ```
2. Open SpaceX project in Xcode:
   ```bash
    open SpaceX.xcodeproj/
   ```
# Usage
- Launch the application to view the list of historical launches.
- Click on a launch item to see extensive launch details.

# Supported Form Factors
- Portrait Mode
- Launches listed and ordered from newest to oldest.
- Click on a launch for detailed information.
- Landscape Mode
- Large Devices:
  - Slider/Detail view.
  - Selected launch item remains highlighted in the list.
  - Details view is populated with selected launch details.
- Small Devices:
  - Display like portrait mode.

# Rotation Support
- Supports orientation changes on all form factors.
