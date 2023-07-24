import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
      ),
      backgroundColor: Colors.blue.shade100,
      bottomNavigationBar: Container(
        color: Colors.blue.shade200,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red600.make(),
            AddToCart(
              catalog: catalog,
            ).wh(130, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h40(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: Colors.blue.shade200,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl3.color(Colors.black).make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                      // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nonummy aliquet, aenean commodo ligula eget dolor."
                      //     .text
                      //     .textStyle(context.captionStyle)
                      //     .make()
                      //     .p16(),
                      ////Bottom Overflowed Pixel Error
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
