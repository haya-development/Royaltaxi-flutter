import 'package:royaltaxi/data/services/api_service.dart';

/// This service handles all order-related API calls.
class OrderService extends ApiService {
  static OrderService? _instance;

  static OrderService get instance => _instance ??= OrderService._();

  OrderService._();

  /// Calculates the price of an order based on the pickup and drop-off locations.
  ///
  /// **Parameters:**
  /// - `data`: A map containing:
  ///   - `"lat_from"`: Latitude of the pickup location (required, as double).
  ///   - `"lang_from"`: Longitude of the pickup location (required, as double).
  ///   - `"lat_to"`: Latitude of the drop-off location (required, as double).
  ///   - `"lang_to"`: Longitude of the drop-off location (required, as double).
  ///
  /// **Returns:**
  /// - A `Map<String, dynamic>` with the order details, including price and distance.
  Future<Map<String, dynamic>?> calculateOrderPrice(Map<String, dynamic> data) async {
    const String url = "api/user/calculate-order-price";
    var response = await post(url, data, auth: true);

    return response;
  }

  /// Confirms an order after calculating its price.
  ///
  /// **Parameters:**
  /// - `orderId`: A string containing the order ID (required).
  /// - `paymentType`: A boolean indicating whether the payment was made (required).
  /// - `womenOnly`: A boolean indicating if the order is for women only (optional).
  ///
  /// **Returns:**
  /// - `true` if the order was successfully confirmed, `false` otherwise.
  Future<bool> confirmOrder(String orderId, bool paymentType, {bool womenOnly = false}) async {
    const String url = "api/user/confirm-make-order";
    var response = await post(url, {
      "orderId": orderId,
      "paymentType": paymentType,
      "womenOnly": womenOnly
    }, auth: true);

    return response?["success"] == true;
  }
}
