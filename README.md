# Perfect Flutter Boiler Plate
## Getting Started
Clone this repository by running the following command in terminal
```
git clone https://github.com/Mr-RobotDev/flutter-boilerplate.git
```
Open the repository
```
cd flutter-boilerplate
```
Get all the packages
```
flutter pub get
```
Open android emulator or Xcode Simulator (only if you have mac) with this command
```
open -a Simulator
```
Finally, run the project
```
flutter run
```
## Git Commits Format
- add: some code
- update: some code
- feat: a new feature
- fix: a bug
- style: improved code readability or added style to some ui component
- clean: clean useless code
- test: unit/ui test cases
## Features
  - Splash View
  - Views - Login, SignUp, Forgot Password, Home
  - Custom Dialog, Snackbar, BottomSheet
  - State Management Solution
  - Check Internet Connection
## Design Pattern

This app is built using the MVVM design pattern, which separates the user interface (view) from the application logic and data (view model). Each view has its own corresponding view model, which is responsible for managing the state of that view.

To further simplify state management, I used the Stacked pub package, which provides a clean and intuitive way to manage state in Flutter apps. This package allows us to easily separate business logic from UI logic and maintain a clear separation of concerns.

This app also follows a service-oriented architecture, where each view model calls the appropriate service method to make an API call. These methods are stored in the services and handle all network communication with the outer world.

Overall, This app's architecture is designed to be scalable, maintainable, and easy to understand. By separating concerns and following best practices, we ensure that this app is efficient and performant while also being easy to extend and modify in the future.
## Dependencies
  - stacked: ^3.1.0-beta.0
  - stacked_services: ^0.9.8
  - flex_color_scheme: ^6.1.2
  - google_fonts: ^4.0.1
  - connectivity_plus: ^3.0.3

## Dev Dependencies
  - build_runner: ^2.2.0
  - stacked_generator: ^0.8.1
  - mockito: ^5.1.0
## Contributing
We welcome contributions from the community and appreciate any help we can get to improve our app. If you're interested in contributing, please follow these guidelines:

  - Fork the project on GitHub
  - Create a new branch from the dev branch to make your changes
  - Commit your changes and push your branch to your fork
  - Create a pull request against the dev branch with a detailed description of your changes
  - Please make sure to follow good coding practices, including writing clean and concise code, and adding tests where appropriate. All pull requests will be reviewed by our team and we will provide feedback as needed.

If you're interested in contributing to our project, but don't know where to start, take a look at our open issues and see if there are any that interest you. We'd be happy to help you get started and answer any questions you have.

Thank you for your interest in contributing to our app!
## License
This project is licensed under the MIT License - see the LICENSE.md file for details
