import 'dart:developer';

import 'package:academiadoflutter/src/dto/order/order_dto.dart';
import 'package:academiadoflutter/src/services/order/get_order_by_id.dart';
import 'package:mobx/mobx.dart';

import '../../models/orders/order_model.dart';
import '../../models/orders/order_status.dart';
import '../../repositories/order/order_repository.dart';

part 'order_controller.g.dart';

enum OrderStateStatus {
  initial,
  loading,
  loaded,
  error,
  showDetailModal,
  statusChanged;
}

class OrderController = OrderControllerBase with _$OrderController;

abstract class OrderControllerBase with Store {
  final OrderRepository _orderRepository;
  final GetOrderById _getOrderById;

  @readonly
  var _status = OrderStateStatus.initial;

  late final DateTime _today;

  @readonly
  OrderStatus? _statusFilter;

  @readonly
  var _orders = <OrderModel>[];

  @readonly
  String? _errorMessage;

  @readonly
  OrderDto? _orderSelected;

  OrderControllerBase(
    this._orderRepository,
    this._getOrderById,
  ) {
    final todayNow = DateTime.now();
    _today = DateTime(todayNow.year, todayNow.month, todayNow.day);
  }

  @action
  Future<void> findOrders() async {
    try {
      _status = OrderStateStatus.loading;
      _orders = await _orderRepository.findAllOrders(_today, _statusFilter);
      _status = OrderStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar pedidos do dia', error: e, stackTrace: s);
      _status = OrderStateStatus.error;
      _errorMessage = 'Erro ao buscar pedidos do dia';
    }
  }

  @action
  Future<void> showDetailModal(OrderModel model) async {
    try {
      _status = OrderStateStatus.loading;
      _orderSelected = await _getOrderById(model);
      _status = OrderStateStatus.showDetailModal;
    } catch (e, s) {
      log('Erro ao exibir detalhes', error: e, stackTrace: s);
      _status = OrderStateStatus.error;
      _errorMessage = 'Erro ao exibir detalhes';
    }
  }

  @action
  Future<void> changeStatus(OrderStatus status) async {
    try {
      _status = OrderStateStatus.loading;
      await _orderRepository.changeStatus(_orderSelected!.id, status);
      _status = OrderStateStatus.statusChanged;
    } catch (e, s) {
      log('Erro ao alterar status', error: e, stackTrace: s);
      _status = OrderStateStatus.error;
      _errorMessage = 'Erro ao alterar status';
    }
  }
}
