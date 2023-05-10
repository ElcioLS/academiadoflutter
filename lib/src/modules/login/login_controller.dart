import 'dart:developer';

import 'package:academiadoflutter/src/core/exceptions/unauthorized_exception.dart';
import 'package:mobx/mobx.dart';

import '../../services/auth/login_service.dart';

part 'login_controller.g.dart';

enum LoginStateStatus {
  initial,
  loading,
  success,
  error;
}

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginService _loginService;

  @readonly
  var _loginStatus = LoginStateStatus.initial;

  @readonly
  String? _errorMessage;

  LoginControllerBase(this._loginService);

  @action
  Future<void> login(String email, String password) async {
    try {
      _loginStatus = LoginStateStatus.loading;

      await _loginService.execute(email, password);
      _loginStatus = LoginStateStatus.success;
    } on UnauthorizedException {
      _errorMessage = 'Login ou senha inválidos';
      _loginStatus = LoginStateStatus.error;
    } catch (e, s) {
      log('Erro ao realizar o login', error: e, stackTrace: s);
      _errorMessage = 'Tente novamente mais tarde ou contate o admin';
      _loginStatus = LoginStateStatus.error;
    }
  }
}
