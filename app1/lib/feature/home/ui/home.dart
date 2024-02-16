import 'package:app1/feature/cart/ui/cart.dart';
import 'package:app1/feature/home/bloc/home_block_bloc.dart';
import 'package:app1/feature/home/ui/product_tile.dart';
import 'package:app1/feature/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final HomeBlockBloc homebloc = HomeBlockBloc();
  @override
  void initState() {
    homebloc.add(Homeinitialevent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlockBloc, HomeBlockState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is homeActionState,
      buildWhen: (previous, current) => current is! homeActionState,
      listener: (context, state) {
        if (state is homeNavigateToCartliststate) {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => cart())));
        } else if (state is homeNavigateToWishListstate) {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => wishlist())));
        } else if (state is homeProductItemCartedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("item carted")));
        } else if (state is homeProductItemWishlistedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("item wishlisted")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case homeLoadingState:
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );

          case homeloadedSucessState:
            final success_state = state as homeloadedSucessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Center(child: Text("grocery store")),
                actions: [
                  IconButton(
                      onPressed: () {
                        homebloc.add(home_wishlist_button_navigator_event());
                      },
                      icon: Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        homebloc.add(home_cart_button_navigator_event());
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: ListView.builder(
                itemCount: success_state.products.length,
                itemBuilder: (context, index) {
                  return product_tile(
                      homebloc: homebloc,
                      productdatamodel: success_state.products[index]);
                },
              ),
            );

          case homeErrorState:
            return Scaffold(
              body: Center(child: Text('error')),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
