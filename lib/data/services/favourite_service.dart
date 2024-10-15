import 'api_service.dart';

class FavoriteService extends ApiService {
  static FavoriteService? _instance;

  static FavoriteService get instance => _instance ??= FavoriteService._();

  FavoriteService._();

  /// Adds a location to the user's favorites.
  ///
  /// [locationUid] is the unique identifier for the location.
  /// [name] is the name of the location.
  /// [lat] is the latitude of the location.
  /// [lang] is the longitude of the location.
  /// Returns `true` if the location was successfully added.
  Future<bool> addToFavorites(
      String locationUid, String name, double lat, double lang) async {
    const String url = "api/user/add_to_fav";
    var payload = {
      "location_uid": locationUid,
      "name": name,
      "lat": lat,
      "lang": lang
    };

    var response = await post(url, payload, auth: true);
    return response?["status"] == true;
  }

  /// Retrieves all favorite locations of the user.
  ///
  /// Returns a list of favorite locations.
  Future<List<Map<String, dynamic>>?> getAllUserFavorites() async {
    const String url = "api/user/all_user_fav";

    var response = await get(url, auth: true);
    return response as List<Map<String, dynamic>>?;
  }

  /// Deletes a favorite location by its ID.
  ///
  /// [favId] is the ID of the favorite location to delete.
  /// Returns `true` if the location was successfully deleted.
  Future<bool> deleteFavorite(String favId) async {
    String url = "api/user/delete_user_fav/$favId";

    var response = await get(url, auth: true);
    return response?["status"] == true;
  }
}
