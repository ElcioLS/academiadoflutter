import 'package:academiadoflutter/src/modules/order/order_page.dart';
import 'package:academiadoflutter/src/repositories/order/order_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/order/order_repository.dart';
import 'order_controller.dart';

class OrderModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<OrderRepository>((i) => OrderRepositoryImpl(i())),
        Bind.lazySingleton((i) => OrderController(i())),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const OrderPage())];
}
