
import 'api_service.dart';

class AuthService extends ApiService {
  static AuthService? _instance;

  static AuthService get instance => _instance ??= AuthService._();

  AuthService._();


}
