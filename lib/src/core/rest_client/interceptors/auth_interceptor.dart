import 'package:academiadoflutter/src/core/global/constants.dart';
import 'package:dio/dio.dart';

import '../../storage/storage.dart';

class AuthInterceptor extends Interceptor {
  final Storage storage;

  AuthInterceptor(this.storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = storage.getData(SessionStorageKeys.accessToken.key);
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   final accessToken = isExpired;
  //   super.onError(err, handler);
  // }
}
