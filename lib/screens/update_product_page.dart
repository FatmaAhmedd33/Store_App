import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custome_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  // convert to statefull widget bec. the ui will change
  const UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, image, desc;
  bool isLoading = false;

  String? price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            //to make child column make scroll
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center, dont make different with  SingleChildScrollView
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                    onchange: (data) {
                      productName = data;
                    },
                    text: 'Product Name'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  text: 'description',
                  onchange: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onchange: (data) {
                      price = data;
                    },
                    textInputType: TextInputType.number,
                    text: 'price'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  text: 'image',
                  onchange: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Update',
                  ontap: ()async {
                    isLoading = true;
                    setState(() {});
                 
                    try {
                        await updateProduct(product);
                      print('success');
                    } catch (e) {
                      print(e
                          .toString()); // can reuse snake bar in the chat project
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

 Future< void> updateProduct(ProductModel product)async {
   await UpdateProductService().updateProduct(
      id: product.id,
        title: productName==null ? product.title:productName!,
        price:price==null? product.price.toString(): price!,
        decs:desc==null?product.description: desc!,
        image: image==null? product.image: image!,
        category: product.category);
  }
}
