import '../../models/auth_model.dart';

abstract class AuthRepository {
  Future<AuthModel> login(String email, password);

  Future<void> register(String name, String email, String password);
}
