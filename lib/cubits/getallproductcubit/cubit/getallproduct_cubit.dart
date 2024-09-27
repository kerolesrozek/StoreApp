import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:storeapp/models/productmodel.dart';
import 'package:storeapp/services/get_all_product_service.dart';

part 'getallproduct_state.dart';

class GetallproductCubit extends Cubit<GetallproductState> {
  GetallproductCubit() : super(GetallproductInitialstate());

  getAllproduct() async {
    emit(Getallproductloadingstate());
    try {
      List<Productmodel> products =
          await GetAllProductService(Dio()).getAllProduct();
      emit(Getallproductsuccessstate(products: products));
    } on DioException catch (e) {
      // TOD
      emit(
        Getallproductfailurestate(e.response!.data),
      );
    } catch (e) {
      emit(Getallproductfailurestate(e.toString()));
    }
  }
}
