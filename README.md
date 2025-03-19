# FormSubmission App

A sleek and modern SwiftUI-based app that lets users submit their details through a simple form. The app is designed to work seamlessly whether online or offline, automatically saving user data when the network is unavailable and resubmitting once connectivity is restored.

---

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Installation](#installation)
- [Usage](#usage)
- [Offline Handling](#offline-handling)
- [Screenshots](#screenshots)
  
---

## Features

- **Form Submission**: Enter your name and email to submit your details to an API.
- **Online & Offline Support**: Automatically saves your data locally when there's no internet and reloads it on app launch.
- **Network Monitoring**: Notifies you when there’s no internet connection and disables online submission.
- **Customizable UI**: Modern, clean, and user-friendly interface built with SwiftUI.
- **Data Persistence**: Uses UserDefaults for local data storage ensuring your information is never lost.

---

## Architecture

The app follows a clean MVVM (Model-View-ViewModel) pattern:

- **View**: SwiftUI views that display the form and network status.
- **ViewModel**: Handles business logic, API calls (via NetworkManager), and offline data saving/loading.
- **Model**: Simple Codable structs for form data.
- **NetworkManager**: Responsible for all online API communications.

---

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/anshhoff/FormSubApp.git
   ```
2. **Open the project:**
   - Navigate to the project folder and open `FormSubmission.xcodeproj` in Xcode.
3. **Build and Run:**
   - Select your target device or simulator and run the app.

---

## Usage

1. **Launch the App:**
   - The app automatically loads any previously saved data.
2. **Enter Your Details:**
   - Input your name and email in the provided text fields.
3. **Submit the Form:**
   - If online, your data is sent to a test API.
   - If offline, your data is saved locally.
4. **Network Status:**
   - A warning message is displayed when there’s no internet connection.

---

## Offline Handling

- **Automatic Data Persistence:**
  - When the network is unavailable, your data is stored using UserDefaults.
- **Resubmission:**
  - Once connectivity is restored, you can manually submit the saved data or it can be handled automatically (with further enhancements).

---

## Screenshots

![image](https://github.com/user-attachments/assets/60371a10-d7ca-48d8-a809-bbe2c15c0d67)

## Author

**Ansh Hardaha**

[LinkedIn](https://www.linkedin.com/in/ansh-hardaha) | [GitHub](https://github.com/anshhoff)

---

Enjoy building and enhancing the FormSubmission App!

