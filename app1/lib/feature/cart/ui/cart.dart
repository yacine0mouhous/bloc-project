import 'package:app1/feature/cart/bloc/cart_bloc.dart';
import 'package:app1/feature/cart/ui/cart_tile.dart';
import 'package:app1/feature/home/bloc/home_block_bloc.dart';
import 'package:app1/feature/home/ui/product_tile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  final CartBloc cartbloc = CartBloc();
  @override
  void initState() {
    cartbloc.add(cartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart list "),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartbloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successtate = state as CartSuccessState;
              return ListView.builder(
                itemCount: successtate.CartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                    cartBloc: cartbloc,
                    ProductDataModel: successtate.CartItems[index],
                  );
                },
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
