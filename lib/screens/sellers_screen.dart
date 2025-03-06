import 'package:flutter/material.dart';

class SellersScreen extends StatelessWidget {
  static const routeName = '/sellers_screen';
  const SellersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sellers")),
      body: const Center(child: Text('Sellers Screen')),
    );
  }
}
