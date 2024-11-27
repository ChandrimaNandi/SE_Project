import 'package:shared_preferences/shared_preferences.dart';

class FavouriteService {
  static const String keyFavourites = 'FavouriteCities';

  // Method to save a city as Favourite
  static Future<void> saveFavouriteCity(String cityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? Favourites = prefs.getStringList(keyFavourites);

    if (Favourites == null) {
      Favourites = [];
    }

    if (!Favourites.contains(cityName)) {
      Favourites.add(cityName);
    }

    await prefs.setStringList(keyFavourites, Favourites);
  }

  // Method to remove a city from Favourites
  static Future<void> removeFavouriteCity(String cityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? Favourites = prefs.getStringList(keyFavourites);

    if (Favourites != null && Favourites.contains(cityName)) {
      Favourites.remove(cityName);
      await prefs.setStringList(keyFavourites, Favourites);
    }
  }

  // Method to check if a city is a Favourite
  static Future<bool> isFavouriteCity(String cityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? Favourites = prefs.getStringList(keyFavourites);

    return Favourites != null && Favourites.contains(cityName);
  }

  // Method to get all Favourite cities
  static Future<List<String>> getFavouriteCities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? Favourites = prefs.getStringList(keyFavourites);

    return Favourites ?? [];
  }
}
