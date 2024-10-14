import 'api_service.dart';

class PaymentService extends ApiService {
  static PaymentService? _instance;

  static PaymentService get instance => _instance ??= PaymentService._();

  PaymentService._();

  /// Makes an authorization request for PayMop with required and optional details.
  ///
  /// [price] - The amount to be charged. (Mandatory)
  /// [paymentType] - The payment type (e.g., "CARD", "WALLET"). (Mandatory)
  /// [firstName] - First name of the payer. (Mandatory)
  /// [lastName] - Last name of the payer. (Mandatory)
  /// [email] - Payer's email address. (Mandatory)
  /// [phoneNumber] - Payer's phone number. (Mandatory)
  /// Optional parameters include [apartment], [floor], [street], [building],
  /// [shippingMethod], [postalCode], [city], [country], and [state].
  Future<Map<String, dynamic>?> makePaymopAuth({
    required String price,
    required String paymentType,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    String? apartment,
    String? floor,
    String? street,
    String? building,
    String? shippingMethod,
    String? postalCode,
    String? city,
    String? country,
    String? state,
  }) async {
    const String url = "api/make-payment-order";

    var payload = {
      "price": price,
      "payment_type": paymentType,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone_number": phoneNumber,
      if (apartment != null) "apartment": apartment,
      if (floor != null) "floor": floor,
      if (street != null) "street": street,
      if (building != null) "building": building,
      if (shippingMethod != null) "shipping_method": shippingMethod,
      if (postalCode != null) "postal_code": postalCode,
      if (city != null) "city": city,
      if (country != null) "country": country,
      if (state != null) "state": state,
    };

    var response = await post(url, payload, auth: true);
    return response as Map<String, dynamic>?;
  }

  /// Makes a payment order request with required payment details.
  ///
  /// [price] - The amount to be charged. (Mandatory)
  /// [paymentType] - The payment type (e.g., "WALLET", "CARD"). (Mandatory)
  /// [firstName] - First name of the payer. (Mandatory)
  /// [lastName] - Last name of the payer. (Mandatory)
  /// [email] - Payer's email address. (Mandatory)
  /// [phoneNumber] - Payer's phone number. (Mandatory)
  Future<Map<String, dynamic>?> makePaymentOrder({
    required String price,
    required String paymentType,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) async {
    const String url = "api/user/make-payment-order";

    var payload = {
      "price": price,
      "payment_type": paymentType,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone_number": phoneNumber,
    };

    var response = await post(url, payload, auth: true);
    return response as Map<String, dynamic>?;
  }
}
