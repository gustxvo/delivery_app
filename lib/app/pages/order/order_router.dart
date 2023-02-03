import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/pages/order/order_controller.dart';
import '../../../../app/pages/order/order_page.dart';
import '../../../app/repositories/order/order_repository.dart';
import '../../../app/repositories/order/order_repository_impl.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<OrderRepository>(
            create: (context) => OrderRepositoryImpl(dio: context.read()),
          ),
          Provider(create: (context) => OrderController(context.read())),
        ],
        child: const OrderPage(),
      );
}
