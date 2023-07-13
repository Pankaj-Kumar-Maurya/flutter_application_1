import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int a = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      appBar: AppBar(
        //backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text("Pankaj Kumar maurya $a"),
      ),
      drawer: const MyDrawer(),
    );
  }
}
