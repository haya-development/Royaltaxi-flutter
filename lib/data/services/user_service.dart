
import 'package:royaltaxi/data/models/user.dart';
import 'package:royaltaxi/utils/helper.dart';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class UserService extends ApiService {
  static UserService? _instance;

  static UserService get instance => _instance ??= UserService._();

  UserService._();

  Future<User?> getUser(userId) async {
    String url = "users/$userId";

    var response = await get(url, auth: false);

    return getApiObjectData<User>(response , User.fromJson);
  }

  Future<bool> updateUserFcmToken(String token) async {
    const String url = "profile/fcm/update-token";
    var response = await post(url, {"fcm_token":token} , auth: true);

    return response?["success"] == true;
  }

  Future<bool> updateProfile(Map<String , dynamic> data) async {
    const String url = "profile/update";
    var response = await post(url, data , auth: true);

    return response?["success"] == true;
  }

  Future<bool> updateProfilePhoto(String path) async {
    const String url = "profile/update-photo";
    var response = await multipart(url, [await http.MultipartFile.fromPath('image', path)], {}, auth: true);

    return response?["success"] == true;
  }

  Future<bool> deleteProfile() async {
    const String url = "profile/delete";

    var response = await delete(url, auth: true);

    return response["success"] == true;
  }

}