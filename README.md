# Coffee Lover

Welcome to this Flutter project repository! This README provides all the necessary details to help you get started with the project. This application is built using Flutter and is designed to showcase best practices and patterns for Flutter development.

## Getting Started

To get started with this project, you will need to have Flutter installed on your machine. If you haven't installed Flutter yet, please follow the installation guide available at the [Flutter official documentation](https://flutter.dev/docs/get-started/install).

### Prerequisites

Ensure you have the following installed:
- Flutter SDK
- Dart SDK (comes with Flutter)
- An IDE (e.g., Android Studio, VS Code, IntelliJ)

### Setting Up

To set up the project after cloning it to your local machine, follow these steps:

1. Navigate to the project directory in your terminal.
2. Run the following command to install all the necessary dependencies: `flutter pub get`


### Code Generation

This project uses code generation for serialization and managing state with Riverpod. Before running the app, you need to generate the necessary files:

Run the following command to generate the required files: `dart run build_runner build --delete-conflicting-outputs`


This command handles the generation of the necessary serialization code and the code required by the state manager (Riverpod).

### Running the Application

To run the application, you can use your IDE’s tools, or run the following command in your terminal: `flutter run`


Make sure you have an emulator running, or a device connected to run the app on.

### Running Tests

To ensure the quality and functionality of the application, tests are crucial. Run the following command to execute all tests:`flutter test`


## Architecture

This project uses Riverpod as its state management solution. [Riverpod](https://riverpod.dev/) allows for a clean separation of concerns and scalable state management, making the codebase more maintainable and testable.




