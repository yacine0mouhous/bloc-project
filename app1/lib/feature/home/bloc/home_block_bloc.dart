import 'dart:async';

import 'package:app1/data/grocery.dart';
import 'package:app1/feature/home/models/home_product_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_block_event.dart';
part 'home_block_state.dart';

class HomeBlockBloc extends Bloc<HomeBlockEvent, HomeBlockState> {
  @override
  HomeBlockBloc() : super(HomeBlockInitial()) {
    on<Homeinitialevent>(homeinitialevent);
    on<home_product_wishlist_button_clicked_event>(
        HomeProductWishlistButtonClickdEevent);

    on<home_product_cart_button_clicked_event>(
        homeproductcartbuttonclickedeven);

    on<home_cart_button_navigator_event>(homecartbuttonnavigatorevent);

    on<home_wishlist_button_navigator_event>(homewishlistbuttonnavigatorevent);
  }

  FutureOr<void> homeinitialevent(
      Homeinitialevent event, Emitter<HomeBlockState> emit) async {
    emit(homeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(homeloadedSucessState(
        products: GroceryProduct()
            .groceryProducts
            .map((e) => productDataModel(
                id: e['id'],
                name: e['name'],
                descreption: e['descreption'],
                price: e['price'],
                imageurl: e['imageurl']))
            .toList()));
  }
}

FutureOr<void> HomeProductWishlistButtonClickdEevent(
    home_product_wishlist_button_clicked_event event,
    Emitter<HomeBlockState> emit) {
  print("wishlist prduct clicked");
}

FutureOr<void> homeproductcartbuttonclickedeven(
    home_product_cart_button_clicked_event event,
    Emitter<HomeBlockState> emit) {
  print("cart  product clicked");
}

FutureOr<void> homecartbuttonnavigatorevent(
    home_cart_button_navigator_event event, Emitter<HomeBlockState> emit) {
  print("cart navigation clicked");

  emit(homeNavigateToCartliststate());
}

FutureOr<void> homewishlistbuttonnavigatorevent(
    home_wishlist_button_navigator_event event, Emitter<HomeBlockState> emit) {
  print("wishlist navigator clicked");
  emit(homeNavigateToWishListstate());
}
