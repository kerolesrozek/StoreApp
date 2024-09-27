part of 'getallproduct_cubit.dart';

@immutable
sealed class GetallproductState {}

final class GetallproductInitialstate extends GetallproductState {}
final class Getallproductloadingstate extends GetallproductState {}
final class Getallproductsuccessstate extends GetallproductState {
 final List<Productmodel>products;

  Getallproductsuccessstate({required this.products});
}
final class Getallproductfailurestate extends GetallproductState {
  final String errormessage;

  Getallproductfailurestate(this.errormessage);
}

