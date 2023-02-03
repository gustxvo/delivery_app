import 'package:delivery_app/app/core/global/global_context.dart';
import 'package:flutter/material.dart';

import './core/provider/application_binding.dart';
import './core/ui/theme/theme.config.dart';
import './pages/auth/register/register_router.dart';
import './pages/home/home_router.dart';
import './pages/splash/splash_page.dart';
import '../../../../app/pages/auth/login/login_router.dart';
import '../../../../app/pages/order/order_completed_page.dart';
import '../../../../app/pages/order/order_router.dart';
import '../../../../app/pages/product_detail/product_detail_router.dart';

class DeliveryApp extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

  DeliveryApp({super.key}) {
    GlobalContext.instance.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Delivery App',
        theme: ThemeConfig.theme,
        navigatorKey: _navKey,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => LoginRouter.page,
          '/auth/register': (context) => RegisterRouter.page,
          '/order': (context) => OrderRouter.page,
          '/order/completed': (context) => const OrderCompletedPage(),
        },
      ),
    );
  }
}
