import 'dart:async';

import 'package:app1/data/cart_item.dart';
import 'package:app1/feature/home/models/home_product_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<cartInitialEvent>(cartinitialevent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEevent);
  }

  FutureOr<void> cartinitialevent(
      cartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(CartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEevent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.ProductDataModel);
// emit()
    emit(CartSuccessState(CartItems: cartItems));
  }
}
