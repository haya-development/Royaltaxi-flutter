import 'package:royaltaxi/data/models/favourite.dart';
import 'package:royaltaxi/utils/helper.dart';

import 'api_service.dart';

class FavoriteService extends ApiService {
  static FavoriteService? _instance;

  static FavoriteService get instance => _instance ??= FavoriteService._();

  FavoriteService._();

  /// Adds a location to the user's favorites.
  ///
  /// [name] is the name of the location.
  /// [lat] is the latitude of the location.
  /// [lang] is the longitude of the location.
  /// Returns `true` if the location was successfully added.
  Future<bool> addToFavorites(Favourite favourite) async {
    const String url = "rider/favorites";
    var payload = favourite.toJson();

    var response = await post(url, payload, auth: true);
    return response != null;
  }

  /// Retrieves all favorite locations of the user.
  ///
  /// Returns a list of favorite locations.
  Future<List<Favourite>?> getAllUserFavorites() async {
    const String url = "rider/favorites";

    var response = await get(url, auth: true);
    return getApiListData<Favourite>(response, Favourite.fromJson);
  }

  /// Deletes a favorite location by its ID.
  ///
  /// [favId] is the ID of the favorite location to delete.
  /// Returns `true` if the location was successfully deleted.
  Future<bool> deleteFavorite(String favId) async {
    String url = "rider/favorites/$favId";

    var response = await get(url, auth: true);
    return response != null;
  }

  /// Deletes all favorites location by its User.
  ///
  /// [favId] is the ID of the favorite location to delete.
  /// Returns `true` if the location was successfully deleted.
  Future<bool> deleteAllFavorite() async {
    String url = "rider/favorites";

    var response = await get(url, auth: true);
    return response != null;
  }
}
