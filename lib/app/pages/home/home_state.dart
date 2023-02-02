// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../../app/dto/order_product_dto.dart';
import '../../models/product_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shoppingBag;

  const HomeState({
    required this.status,
    required this.products,
    required this.shoppingBag,
    this.errorMessage,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        shoppingBag = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, shoppingBag, errorMessage];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    List<OrderProductDto>? shoppingBag,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      shoppingBag: shoppingBag ?? this.shoppingBag,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
