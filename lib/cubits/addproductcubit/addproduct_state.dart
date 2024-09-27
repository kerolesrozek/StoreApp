part of 'addproduct_cubit.dart';

@immutable
sealed class AddproductState {}

final class AddproductInitialStaet extends AddproductState {}
final class AddproductLoadingState extends AddproductState {}
final class AddproductSuccessState extends AddproductState {}
final class AddproductFailureState extends AddproductState {
 final String errormessage;

  AddproductFailureState(this.errormessage);
}
