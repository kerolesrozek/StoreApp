import 'package:flutter/material.dart';
import 'package:storeapp/models/productmodel.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });
  final Productmodel product;
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        // height: 130,
        // width: 140,
        child: Card(
          // color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                product.title,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
              ),
              Row(
                children: [
                  Text(
                    '${product.price}\$',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
                ],
              )
            ],
          ),
        ),
      ),
      Positioned(
          left: 60,
          top: -60,
          child: Image.network(
            product.image,
            width: 100,
            height: 100,
          ))
    ]);
  }
}
