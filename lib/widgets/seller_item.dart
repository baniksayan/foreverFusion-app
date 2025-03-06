import 'package:flutter/material.dart';
import '../models/seller.dart';

class SellerItem extends StatelessWidget {
  final Seller seller;
  final Color backgroundColor;

  const SellerItem({super.key, required this.seller, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 23.0,
      ),
      height: 200.0,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(13.0),
),
    );
  }
}