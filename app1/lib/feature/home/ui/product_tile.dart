import 'package:app1/feature/home/bloc/home_block_bloc.dart';
import 'package:app1/feature/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class product_tile extends StatelessWidget {
  final productDataModel productdatamodel;
  final HomeBlockBloc homebloc;
  const product_tile(
      {super.key, required this.productdatamodel, required this.homebloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productdatamodel.imageurl))),
          ),
          const SizedBox(height: 20),
          Text(productdatamodel.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(productdatamodel.descreption),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + productdatamodel.price.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    homebloc.add(home_product_wishlist_button_clicked_event(
                        clickedproduct: productdatamodel));
                  },
                  icon: Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    homebloc.add(home_product_cart_button_clicked_event(
                        clickedproduct: productdatamodel));
                  },
                  icon: Icon(Icons.shopping_bag_outlined)),
            ],
          ),
        ],
      ),
    );
  }
}
