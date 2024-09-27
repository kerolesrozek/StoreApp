import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:storeapp/models/productmodel.dart';
import 'package:storeapp/services/addproductsevice.dart';

part 'addproduct_state.dart';

class AddproductCubit extends Cubit<AddproductState> {
  AddproductCubit() : super(AddproductInitialStaet());

  addproduct({required Productmodel product}) {
    emit(AddproductLoadingState());
    
    try {
      
      Addproductsevice(Dio()).addProduct(product);
      emit(AddproductSuccessState());
    } catch (e) {
      // TODO
      emit(
        AddproductFailureState(
          e.toString(),
        ),
      );
    }
  }
}
