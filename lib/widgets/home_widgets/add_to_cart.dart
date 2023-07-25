import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    super.key,
    required this.catalog,
  });

  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [
      AddMutation,
      RemoveMutation
    ]); //VxState.listen( ,to: )// not working
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // isInCart = isInCart.toggle();
          //  final _catalog = CatalogModel();

          // _cart.catalog = _catalog;

          AddMutation(catalog);

          // _cart.add(catalog);
          // setState(() {});
        }
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
        const StadiumBorder(),
      )),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
