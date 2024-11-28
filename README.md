
# Weather App

This Weather App is a comprehensive Flutter project designed to provide users with up-to-date weather information for their chosen locations. The app features a dynamic splash screen with animations, a search functionality, support for both light and dark themes. Additionally, users can manage a list of favorite cities and also get the weather based on their current location.

# Features

**Dynamic Splash Screen:** Enjoy an engaging splash screen with animations on app launch.

**Weather Search:** Search for weather information by city name and view detailed weather conditions.

**Current Location Weather:** Use your current location to get local weather updates.

**Favorite Cities:** Add or remove cities from your favorites list and quickly access weather details for those locations.

**Light and Dark Themes:** Toggle between light and dark modes for a customized user experience.

# Getting Started

**Prerequisites**
  
- **Flutter SDK:** Install Flutter.
- **Dart SDK:** Included with Flutter.

**Installation**
  
- Clone the repository: git clone https://github.com/ChandrimaNandi/SE_Project/
- Navigate to the project directory: `cd weather_app`.
- Install dependencies: `flutter pub get`.

**Running the App**
- Run the app on an emulator or physical device: `flutter run`.

**Testing the App**
- The project includes test files located in the `test` directory for unit testing and validation.
- Run tests using: `flutter test`.

**Running on a Physical Device**
- Switch on developer mode on your device and connect it to your computer.
- Run the app using the command: `flutter run`.
- You can also use Android Studio to run the app on an emulator or a device template of your choice.

# Project Structure

**lib/main.dart**: Entry point of the application.

**lib/pages/**: Contains the main screens such as WeatherPage, FavouriteCitiesPage, SearchPage, and SplashScreen.

**lib/models/**: Defines the data models, including Weather and FavouriteModel.

**lib/service/**: Includes services for weather data retrieval and managing favorite cities.

**lib/widgets/**: Custom widgets used throughout the app.

**assets/**: Contains animation files and other assets, including all `.json` files used for animations.

**test/**: Contains all test files for the application to ensure code reliability and correctness.

# Dependencies

**flutter**: The framework itself.

**provider**: State management.

**geolocator**: For accessing the device's location.

**geocoding**: For converting coordinates into readable addresses.

**shared_preferences**: For storing favorite cities locally.

**lottie**: For splash screen animations.

**http**: For making network requests.

# Contributors

**Chandrima Nandi (IMT2022062):**
-Designed and implemented the **models**, including `Weather` and `FavouriteModel`, and created the **test** files for unit testing the application logic. 

**Saniya Ismail (IMT2022128)**
- Worked on the **assets** folder and ensured all required `.json` animation files were added, as well as developed the **main.dart** file and **WeatherPage** screen.

**Ragini Metlapalli (IMT2022029)**
- Developed the **FavouriteCitiesPage** screen and built the **SplashScreen** with animations for a smooth app startup experience.

**Niveditha Verma (IMT2021033)**
- Created the **SearchPage** for city-based weather searches and contributed to the development of the **WeatherPage** screen, enhancing UI components.


# Demo Video of the App


https://github.com/user-attachments/assets/da485841-eba8-41d0-b2cd-6b2974d0ad6d



