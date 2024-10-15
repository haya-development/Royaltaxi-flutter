import 'package:http/http.dart' as http;
import 'package:royaltaxi/data/models/order.dart';
import 'package:royaltaxi/utils/helper.dart';
import 'dart:convert';
import 'api_service.dart';

class OrderService extends ApiService {
  static OrderService? _instance;

  static OrderService get instance => _instance ??= OrderService._();

  OrderService._();

  /// Calculates the order price based on provided coordinates.
  ///
  /// [latFrom] is the latitude of the starting location.
  /// [langFrom] is the longitude of the starting location.
  /// [latTo] is the latitude of the destination.
  /// [langTo] is the longitude of the destination.
  /// Returns a map with the price, order ID, distance, and duration.
  Future<Map<String, dynamic>?> calculateOrderPrice(
      double latFrom, double langFrom, double latTo, double langTo) async {
    const String url = "api/user/calculate-order-price";
    var payload = {
      "lat_from": latFrom,
      "lang_from": langFrom,
      "lat_to": latTo,
      "lang_to": langTo
    };

    var response = await post(url, payload, auth: true);
    return response;
  }

  /// Checks the coupon status for an order.
  ///
  /// [orderId] is the ID of the order.
  /// [code] is the coupon code to check.
  /// Returns `true` if the coupon is valid, otherwise `false`.
  Future<Map<String, dynamic>?> checkCouponStatus(
      String orderId, String code) async {
    const String url = "api/check-coupon-status";
    var payload = {"orderId": orderId, "code": code};

    var response = await post(url, payload, auth: true);
    return response;
  }

  /// Confirms an order with the provided details.
  ///
  /// [orderId] is the ID of the order to confirm.
  /// [code] is the coupon code applied to the order.
  /// [paymentType] specifies whether the payment is done (true) or not (false).
  /// [womenOnly] specifies whether the order is for women only (true/false).
  /// Returns `true` if the order confirmation was successful, otherwise `false`.
  Future<bool> confirmMakeOrder(
      String orderId, String code, bool paymentType, bool womenOnly) async {
    const String url = "api/user/confirm-make-order";
    var payload = {
      "orderId": orderId,
      "code": code,
      "paymentType": paymentType,
      "womenOnly": womenOnly
    };

    var response = await post(url, payload, auth: true);
    return response?["status"] == true;
  }

  /// Retrieves the user’s orders with pagination.
  ///
  /// [page] is the page number to retrieve (default is 1).
  /// [limit] is the number of items per page (default is 10).
  /// Returns a list of orders.
  Future<List<Order>?> getUserOrders(
      {int page = 1, int limit = 10}) async {
    String url = "api/user/user-orders?page=$page&limit=$limit";

    var response = await get(url, auth: true);
    return getApiListData<Order>(response , Order.fromJson);
  }

  /// Checks the current order status.
  ///
  /// Returns the status of the current order as a string.
  Future<Map<String, dynamic>?> getCurrentOrderStatus() async {
    const String url = "api/user/current_order_status";

    var response = await get(url, auth: true);
    return response;
  }

  /// Rates an order.
  ///
  /// [orderId] is the ID of the order to rate.
  /// [rate] is the rating to give the order (from 1 to 5).
  /// Returns `true` if the rating was successfully submitted.
  Future<bool> rateOrder(String orderId, int rate) async {
    String url = "api/user/rate-order?idOrder=$orderId&rate=$rate";

    var response = await get(url, auth: true);
    return response?["status"] == true;
  }

  /// Cancels an order.
  ///
  /// [orderId] is the ID of the order to cancel.
  /// Returns `true` if the order was successfully cancelled.
  Future<bool> cancelOrder(String orderId) async {
    String url = "api/v2/order/cancel?idOrder=$orderId";

    var response = await patch(url, null, auth: true);
    return response?["status"] == true;
  }
}
