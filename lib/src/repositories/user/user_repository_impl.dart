import 'dart:developer';

import 'package:academiadoflutter/src/core/exceptions/repository_exception.dart';
import 'package:academiadoflutter/src/core/rest_client/custom_dio.dart';
import 'package:academiadoflutter/src/models/user_model.dart';
import 'package:dio/dio.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio _dio;

  UserRepositoryImpl(this._dio);
  @override
  Future<UserModel> getById(int id) async {
    try {
      final userResponse = await _dio.get('/users/$id');

      return UserModel.fromMap(userResponse.data);
    } on DioError catch (e, s) {
      log('Erro ao uscar usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar usuário');
    }
  }
}
