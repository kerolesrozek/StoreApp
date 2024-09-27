import 'package:dio/dio.dart';
import 'package:storeapp/models/productmodel.dart';

class Addproductsevice {
 final Dio dio;

  Addproductsevice(this.dio);

  addProduct(Productmodel productmodel)async{
    try {
  
   Response response=  await dio.post('https://fakestoreapi.com/products',data: productmodel) ;
  Map<String,dynamic>jsonData= response.data;
   
}  catch (e) {
  // TODO
  throw Exception(e.toString());
}

  }
}