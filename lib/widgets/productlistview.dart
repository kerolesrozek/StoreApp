
import 'package:flutter/material.dart';
import 'package:storeapp/models/productmodel.dart';
import 'package:storeapp/widgets/productwidget.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key, required this.products,
  });
  final List<Productmodel>products;

  @override
  Widget build(BuildContext context) {
 
    return Padding(
      padding: const EdgeInsets.only(top: 70,left: 10,right: 10),
      child: GridView.builder(
        clipBehavior: Clip.none,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.4,
            crossAxisCount: 2,
            mainAxisSpacing: 100,
            crossAxisSpacing: 30
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductWidget(
product: products[index],
            );
          }),
    );
  }
}

