import 'package:academiadoflutter/src/core/rest_client/interceptors/auth_interceptor.dart';
import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import '../env/env.dart';
import '../storage/storage.dart';

class CustomDio extends DioForBrowser {
  late AuthInterceptor _authInterceptor;

  CustomDio(Storage storage)
      : super(
          BaseOptions(
            baseUrl: Env.instance.get('backend_base_url'),
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    _authInterceptor = AuthInterceptor(storage);
  }
  CustomDio auth() {
    print('interceptors: ${interceptors.length}');
    if (!interceptors.contains(_authInterceptor)) {
      interceptors.add(
          _authInterceptor); //Bug estava bem aqui, linha 32 - Quantidade de intercepors
    }
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
