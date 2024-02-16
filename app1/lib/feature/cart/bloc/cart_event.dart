part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class cartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final productDataModel ProductDataModel;

  CartRemoveFromCartEvent({required this.ProductDataModel});
}
