import 'package:app1/feature/cart/ui/cart.dart';
import 'package:app1/feature/home/bloc/home_block_bloc.dart';
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
        }
      },
      builder: (context, state) {
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
        );
      },
    );
  }
}
