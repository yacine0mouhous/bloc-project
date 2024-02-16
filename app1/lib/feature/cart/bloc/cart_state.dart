part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<productDataModel> CartItems;

  CartSuccessState({required this.CartItems});
}
