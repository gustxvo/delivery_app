import 'dart:developer';

import 'package:delivery_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:delivery_app/app/pages/auth/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repositories/auth/auth_repository.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginController(this._authRepository) : super(const LoginState.inital());

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      final authModel = await _authRepository.login(email, password);
      final prefs = await SharedPreferences.getInstance();

      prefs.setString('accessToken', authModel.accessToken);
      prefs.setString('refreshToken', authModel.refreshToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedException catch (e, s) {
      emit(
        state.copyWith(
            status: LoginStatus.loginError,
            errorMessage: 'Login ou senha inválidos'),
      );
      log('Login ou senha inválidos', error: e, stackTrace: s);
    } catch (e, s) {
      emit(
        state.copyWith(
            status: LoginStatus.error, errorMessage: 'Erro ao realizar login'),
      );
      log('Erro ao realizar login', error: e, stackTrace: s);
    }
  }
}
