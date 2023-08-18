# CashAppStocks - MVVM SwiftUI App

## Architectural Approach

### Model-View-ViewModel (MVVM)

The app adopts the MVVM architectural pattern, which is particularly well-suited for data-binding frameworks. The main components of this architecture are:

- **Model**: Represents the data and business logic of the app. In our case, it's the `Stock` and `Portfolio` structures.
  
- **View**: Represents the UI of the app. It observes the ViewModel to get the necessary data and actions. In our app, `StockListView` and `StockDetailView` are examples of views.
  
- **ViewModel**: Acts as a bridge between the Model and the View. It holds the presentation logic and is responsible for transforming the Model information into values that can be displayed on a View. Our `StockViewModel` is responsible for fetching and decoding the stock data.

## Trade-offs

### Pros of MVVM with SwiftUI:

1. **Decoupling**: MVVM promotes a clear separation of concerns. This makes the codebase easier to understand, test, and maintain.
  
2. **Testability**: With the separation of concerns, it's easier to write unit tests. Business logic is kept away from the UI, allowing for better unit tests around the ViewModel.
  
3. **Reusability**: ViewModels can be reused across different views.
  
4. **Data Binding**: SwiftUI's data binding works seamlessly with MVVM. Using `@ObservedObject` and `@Published`, the UI can automatically update when the data changes.

### Cons:

1. **Initial Complexity**: For simple apps, MVVM can introduce an initial overhead. However, as the app grows, the benefits of MVVM become more apparent.
  
2. **Overhead for Simple UI**: If a view is extremely simple and doesn't require any business logic, creating a ViewModel might seem unnecessary.

### Networking:

1. **Pros**: Keeping networking within the ViewModel ensures that the View remains free of business logic and only handles UI-related tasks. This also makes it easier to mock network responses for testing.

## How to Run the Project

### Prerequisites:

- Ensure you have Xcode installed on your macOS machine.
- An active internet connection to clone the repository.

### Steps:

#### Getting the Project:

##### Option 1: Clone the Repository

1. Open Terminal and run the following command to clone the repository:
   ```bash
   git clone git@github.com:vgutierrez542/CashAppStocks.git
   ```

##### Option 2: Download from GitHub Website

  1. Navigate to the project's GitHub repository: [CashAppStocks on GitHub](https://github.com/vgutierrez542/CashAppStocks)
  2. Click on the green `Code` button.
  3. In the dropdown, click `Download ZIP`.
  4. Once downloaded, extract the ZIP file to your desired location.

#### Open the Project in Xcode:
   Navigate to the directory where you cloned/downloaded the repository and open the `.xcodeproj` file.

#### Select a Device or Simulator:
   In Xcode, at the top of the window, you'll see a dropdown menu where you can select a target device or simulator. Choose the device you want to run the app on.

#### Run the App:
   Press the "Play" button (▶️) at the top-left corner of Xcode or use the shortcut `Cmd + R` to build and run the app. The app will launch on your selected device or simulator.

#### Explore:
   Once the app is running, you can interact with it on your device or simulator.
