import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.xl3.color(Colors.black).make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Use VxConsumer if need notification
          VxBuilder(
            mutations: const {RemoveMutation},
            builder: (context, _, __) {
              //now Builder take three Pairameters
              return "\$${_cart.totalPrice}".text.xl4.color(Colors.red).make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "This Feature Avaliable in Future".text.make(),
                ),
              );
            },
            child: "Buy".text.bold.xl.make(),
          ).w24(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]); //VxState.listen not working
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing To Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                  //_cart.remove(_cart.items[index]);
                  // setState(() {});
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
