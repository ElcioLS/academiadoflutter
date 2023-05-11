import 'package:academiadoflutter/src/modules/payment_type/payment_type_controller.dart';
import 'package:academiadoflutter/src/modules/payment_type/payment_type_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentTypeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => PaymentTypeController(i())),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const PaymentTypePage())];
}
