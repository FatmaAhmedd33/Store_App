import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String decs,
      required String image,
      required dynamic id,
      required String category}) async {
    print('id=$id');
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': decs,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}
