part of 'home_block_bloc.dart';

@immutable
abstract class HomeBlockState {}

abstract class homeActionState extends HomeBlockState {}

final class HomeBlockInitial extends HomeBlockState {}

class homeLoadingState extends HomeBlockState {}

class homeloadedSucessState extends HomeBlockState {
  final List<productDataModel> products;

  homeloadedSucessState({required this.products});
}

class homeErrorState extends HomeBlockState {}

class homeNavigateToWishListstate extends homeActionState {}

class homeNavigateToCartliststate extends homeActionState {}
