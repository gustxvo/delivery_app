import 'dart:developer';

import 'package:dio/dio.dart';

import './order_repository.dart';
import '../../../app/core/exceptions/repository_exception.dart';
import '../../../app/core/rest_client/custom_dio.dart';
import '../../../app/models/payment_type_model.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio dio;

  OrderRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<PaymentTypeModel>> getAllPaymentTypes() async {
    try {
      final resullt = await dio.auth().get('/payment-types');
      return resullt.data
          .map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar formas de pagamneto', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar formas de pagamento');
    }
  }
}
