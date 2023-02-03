import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/dto/order_product_dto.dart';
import '../../../../app/pages/order/order_state.dart';
import '../../../app/repositories/order/order_repository.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrderController(this._orderRepository) : super(const OrderState.initial());

  void load(List<OrderProductDto> products) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));
      final paymentTypes = await _orderRepository.getAllPaymentTypes();

      emit(state.copyWith(
          status: OrderStatus.loaded,
          orderProducts: products,
          paymentTypes: paymentTypes));
    } catch (e, s) {
      log('Erro ao carregar página', error: e, stackTrace: s);
      emit(state.copyWith(
          status: OrderStatus.error, errorMessage: 'Erro ao carregar página'));
    }
  }
}