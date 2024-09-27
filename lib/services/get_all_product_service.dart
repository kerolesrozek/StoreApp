import 'package:dio/dio.dart';
import 'package:storeapp/models/productmodel.dart';

class GetAllProductService {
  final Dio dio;

  GetAllProductService(this.dio);

 Future<List<Productmodel>> getAllProduct() async {
    Response response = await dio.get('https://fakestoreapi.com/products');
    List<dynamic> jsonData = response.data;
    List<Productmodel> products = [];
    for (var element in jsonData) {
      products.add(
        Productmodel.fromJson(element),
      );
    }
    return products;
  }
}
