import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_colored_print/flutter_colored_print.dart' as logger;
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:royaltaxi/data/config/config.dart';
import 'package:royaltaxi/utils/api_exception.dart';
import 'package:royaltaxi/utils/helper.dart';

class ApiService {
  /// get data request
  /// used for read data
  Future<dynamic> get(String api, {bool auth = false}) async {
    var uri = Uri.parse("${Config.apiBaseUrl}/$api");

    logger.info('GET API REQUEST:: ${uri.toString()}');

    try {
      var headers = _getHeaders(auth: auth);
      if (headers == null) {
        return null;
      }
      var response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: Config.timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  /// post data request
  /// used for store data
  Future<dynamic> post(String api, dynamic payloadObj,
      {bool auth = false}) async {
    var uri = Uri.parse("${Config.apiBaseUrl}/$api");

    logger.info('POST API REQUEST:: ${uri.toString()}');

    var payload = json.encode(payloadObj);
    try {
      var headers = _getHeaders(auth: auth);
      if (headers == null) {
        return null;
      }
      var response = await http
          .post(uri, body: payload, headers: headers)
          .timeout(const Duration(seconds: Config.timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  /// put data request
  /// used for edit
  Future<dynamic> put(String api, dynamic payloadObj,
      {bool auth = false}) async {
    var uri = Uri.parse("${Config.apiBaseUrl}/$api");

    logger.info('PUT API REQUEST:: ${uri.toString()}');

    var payload = json.encode(payloadObj);
    try {
      var headers = _getHeaders(auth: auth);
      if (headers == null) {
        return null;
      }
      var response = await http
          .put(uri, body: payload, headers: headers)
          .timeout(const Duration(seconds: Config.timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  /// delete request
  /// used for delete data
  Future<dynamic> delete(String api, {bool auth = false}) async {
    var uri = Uri.parse("${Config.apiBaseUrl}/$api");

    logger.info('DELETE API REQUEST:: ${uri.toString()}');

    try {
      var headers = _getHeaders(auth: auth);
      if (headers == null) {
        return null;
      }
      var response = await http
          .delete(uri, headers: headers)
          .timeout(const Duration(seconds: Config.timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  /// multipart request
  /// used for upload files
  Future<dynamic> multipart(
      String api, List<http.MultipartFile> files, Map<String, dynamic> fields,
      {bool auth = false}) async {
    var uri = Uri.parse("${Config.apiBaseUrl}/$api");

    logger.info('Multipart API REQUEST:: ${uri.toString()}');

    try {
      var headers = _getHeaders(auth: auth);
      if (headers == null) {
        return null;
      }
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      request.fields.addAll(Map<String, String>.from(fields));
      request.files.addAll(files);

      var streamResponse = await request
          .send()
          .timeout(const Duration(seconds: Config.timeOutDuration));
      var response = await http.Response.fromStream(streamResponse);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  /// handle response of the request
  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 252:
        var responseJson = json.decode(response.body);
        responseJson['status'] = response.statusCode;
        return responseJson;
      case 400:
        throw BadRequestException(
            getResponseMessage(json.decode(response.body)["message"]),
            response.request?.url.toString());
      case 401:
        throw UnAuthorizedException(
            getResponseMessage(json.decode(response.body)["message"]),
            response.request?.url.toString());
      case 403:
        throw NotAuthorizedException(
            getResponseMessage(json.decode(response.body)["message"]),
            response.request?.url.toString());
      case 404:
        throw NotFoundException(
            getResponseMessage(json.decode(response.body)["message"]),
            response.request?.url.toString());
      case 422:
        throw BadRequestException(
            getResponseMessage(json.decode(response.body)["message"]),
            response.request?.url.toString());
      case 423:
        throw SuspendedRequestException(
            getResponseMessage(json.decode(response.body)["message"]),
            response.request?.url.toString());
      case 429:
        throw TooManyRequestsException(
            getResponseMessage(json.decode(response.body)["message"]),
            response.request?.url.toString(),
            response.headers[HttpHeaders.retryAfterHeader]);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with code : ${response.statusCode}',
            response.request?.url.toString());
    }
  }

  /// get required headers
  static Map<String, String>? _getHeaders({bool auth = false}) {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.acceptLanguageHeader: getLanguageCode(),
    };

    String apiToken = getUserToken();
    if (apiToken.isEmptyOrNull) {
      if (auth == true) {
        return null;
      }
    } else {
      headers.addAll({"idToken": apiToken});
    }

    return headers;
  }

  /// get response messages like validate messages
  static String? getResponseMessage(message) {
    if (message is Map<String, dynamic> && message.isNotEmpty) {
      String? key = message.keys.toList().first;
      if (key.isEmptyOrNull == false) {
        return message[key];
      }
    } else if (message is String && message.isNotEmpty) {
      return message;
    }
    return null;
  }
}
