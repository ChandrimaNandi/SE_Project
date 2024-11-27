import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/fav_model.dart';
import '../pages/weather_page.dart';

class FavouriteCitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Cities'),
        centerTitle: true,
      ),
      body: Consumer<FavouriteModel>(
        builder: (context, favouriteModel, child) {
          List<String> favouriteCities = favouriteModel.favouriteCities;

          return favouriteCities.isEmpty
              ? Center(
                  child: Text(
                    'No favourite cities yet.',
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                )
              : ListView.builder(
                  itemCount: favouriteCities.length,
                  itemBuilder: (context, index) {
                    String cityName = favouriteCities[index];
                    return Dismissible(
                      key: Key(cityName), // Unique key for each item
                      direction: DismissDirection.endToStart, // Swipe to delete
                      onDismissed: (direction) {
                        favouriteModel.removeFromFavourites(cityName);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$cityName removed from favourites'),
                          ),
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      child: ListTile(
                        title: Text(cityName),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WeatherPage(cityName: cityName),
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            favouriteModel.removeFromFavourites(cityName);
                          },
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
