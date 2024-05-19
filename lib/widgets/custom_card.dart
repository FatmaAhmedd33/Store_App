import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          //  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: const Offset(10, 10))
          ]),
          child: Card(
            surfaceTintColor: Colors.white,
            shadowColor: Colors.grey,
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.substring(0, 7),
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r'$'
                          '${product.price.toString()}'), // r before string colled row string display string like what it look
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.heart))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 80,
          bottom: 130,
          child: Image.network(
            product.image,
            height: 100,
            width: 100,
          ),
        )
      ]),
    );
  }
}
