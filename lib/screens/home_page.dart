import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.cartShopping))
          ],
          title: const Text('New Trend'),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
            child: FutureBuilder<List<ProductModel>>(
                future: AllProductsServices().getALLproduct(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductModel> Products = snapshot.data!;
                    return GridView.builder(
                        itemCount: Products.length,
                        clipBehavior: Clip.none,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.2,
                                mainAxisSpacing: 85,
                                crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return CustomCard(
                            product: Products[index],
                          );
                        });
                  } else {
                    return   Center(child:  CircularProgressIndicator());
                  }
                })));
  }
}
