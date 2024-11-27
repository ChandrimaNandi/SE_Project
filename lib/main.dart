import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/favourite.dart';
import './pages/search.dart';
import './pages/splash.dart';
import './pages/weather_page.dart';
import './models/fav_model.dart';
import './theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => FavouriteModel()),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: const SplashScreen(),
            routes: {
              '/homepage': (context) => const WeatherPage(),
              '/favpage': (context) => FavouriteCitiesPage(),
              '/searchpage': (context) => const SearchPage(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == '/homepage') {
                final cityName = settings.arguments as String?;
                return MaterialPageRoute(
                  builder: (context) => WeatherPage(cityName: cityName),
                );
              }
              return null;
            },
          );
        },
      ),
    );
  }
}
