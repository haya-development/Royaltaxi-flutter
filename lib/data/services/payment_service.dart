import 'package:http/http.dart' as http;
import 'api_service.dart';

/// This service handles all payment-related API calls.
class PaymentService extends ApiService {
  static PaymentService? _instance;

  static PaymentService get instance => _instance ??= PaymentService._();

  PaymentService._();

  /// Creates a new payment order.
  ///
  /// This function sends a request to make a payment order.
  ///
  /// **Parameters:**
  /// - `paymentData`: A map containing payment details such as:
  ///   - `"price"`: The price for the order (required, as a String).
  ///   - `"payment_type"`: Type of payment (required).
  ///   - `"first_name"`: First name of the payer (required).
  ///   - `"last_name"`: Last name of the payer (required).
  ///   - `"email"`: Payer's email (required).
  ///   - `"phone_number"`: Payer's phone number (required).
  ///   - `"apartment"`, `"floor"`, `"street"`, `"building"`, `"shipping_method"`, `"postal_code"`, `"city"`, `"country"`, `"state"`: Optional shipping information.
  ///
  /// **Returns:**
  /// - `true` if the payment was successful, `false` otherwise.
  Future<bool> makePaymentOrder(Map<String, dynamic> paymentData) async {
    const String url = "api/make-payment-order";
    var response = await post(url, paymentData, auth: true);

    return response?["success"] == true;
  }

  /// Handles Paymob processed callback.
  ///
  /// This function processes the callback data from Paymob.
  ///
  /// **Parameters:**
  /// - `data`: A map containing:
  ///   - `"price"`: The price for the order (required).
  ///   - `"payment_type"`: The type of payment (required).
  ///   - `"first_name"`, `"last_name"`, `"email"`, `"phone_number"`: Payer details (all required).
  ///
  /// **Returns:**
  /// - `true` if the callback was processed successfully, `false` otherwise.
  Future<bool> paymobProcessedCallback(Map<String, dynamic> data) async {
    const String url = "api/payment/paymob";
    var response = await post(url, data, auth: true);

    return response?["success"] == true;
  }

  /// Sends Paymob response callback.
  ///
  /// This function sends a response callback to Paymob.
  ///
  /// **Parameters:**
  /// - `uid`: A string containing the unique identifier for the transaction (required).
  ///
  /// **Returns:**
  /// - `true` if the callback was successful, `false` otherwise.
  Future<bool> paymobResponseCallback(String uid) async {
    const String url = "api/user";
    var response = await post(url, {"uid": uid}, auth: true);

    return response?["success"] == true;
  }
}
