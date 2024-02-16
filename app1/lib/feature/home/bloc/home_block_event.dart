part of 'home_block_bloc.dart';

@immutable
abstract class HomeBlockEvent {}

class Homeinitialevent extends HomeBlockEvent {}

class home_product_wishlist_button_clicked_event extends HomeBlockEvent {}

class home_product_cart_button_clicked_event extends HomeBlockEvent {}

class home_wishlist_button_navigator_event extends HomeBlockEvent {}

class home_cart_button_navigator_event extends HomeBlockEvent {}
