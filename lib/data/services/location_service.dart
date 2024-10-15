import 'api_service.dart';

class LocationService extends ApiService {
  static LocationService? _instance;

  static LocationService get instance => _instance ??= LocationService._();

  LocationService._();

  /// Retrieves all available cities.
  ///
  /// Returns a list of cities.
  Future<List<Map<String, dynamic>>?> getAllCities() async {
    const String url = "api/location";
    var response = await get(url, auth: true);
    return response as List<Map<String, dynamic>>?;
  }

  /// Retrieves all blocks (or areas if blocks are unavailable) for a given city.
  ///
  /// [cityID] is the unique identifier for the city.
  /// Returns a list of blocks or areas.
  Future<List<Map<String, dynamic>>?> getBlocks(String cityID) async {
    String url = "api/location/$cityID";
    var response = await get(url, auth: true);
    return response as List<Map<String, dynamic>>?;
  }

  /// Retrieves all areas within a specific block.
  ///
  /// [blockID] is the unique identifier for the block.
  /// Returns a list of areas within the block.
  Future<List<Map<String, dynamic>>?> getAreas(String blockID) async {
    String url = "api/location/area/$blockID";
    var response = await get(url, auth: true);
    return response as List<Map<String, dynamic>>?;
  }

  /// Retrieves all markers within a specific area.
  ///
  /// [areaID] is the unique identifier for the area.
  /// Returns a list of markers within the area.
  Future<List<Map<String, dynamic>>?> getMarkers(String areaID) async {
    String url = "api/location/marker/$areaID";
    var response = await get(url, auth: true);
    return response as List<Map<String, dynamic>>?;
  }
}
