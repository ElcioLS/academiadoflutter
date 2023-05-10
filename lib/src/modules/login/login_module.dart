import 'package:academiadoflutter/src/repositories/auth/auth_repository_impl.dart';
import 'package:academiadoflutter/src/services/auth/login_service.dart';
import 'package:academiadoflutter/src/services/auth/login_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/auth/auth_repository.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(i())),
        Bind.lazySingleton<LoginService>((i) => LoginServiceImpl(i(), i())),
        Bind.lazySingleton((i) => LoginController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
      ];
}
