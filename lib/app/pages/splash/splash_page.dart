import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        children: [
          Container(),
          DeliveryButton(
            width: 200,
            heigth: 200,
            label: 'Teste',
            onPressed: () {},
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'text'),
          )
        ],
      ),
    );
  }
}
