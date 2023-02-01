import 'package:delivery_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:delivery_app/app/models/product_model.dart';
import 'package:delivery_app/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DeliveryAppBar(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return DeliveryProductTile(
                    product: ProductModel(
                        id: 1,
                        name: 'Burgão',
                        description: 'Produto em falta',
                        price: 12.0,
                        image:
                            'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800'),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
