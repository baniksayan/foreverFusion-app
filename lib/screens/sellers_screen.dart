import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/seller.dart';
import '../widgets/seller_item.dart';

class SellersScreen extends StatefulWidget {
  static const routeName = '/sellers_screen';
  const SellersScreen({Key? key}) : super(key: key);

  @override
  State<SellersScreen> createState() => _SellersScreenState();
}

class _SellersScreenState extends State<SellersScreen> {
  List<Color> SellerItemsBackgroundColor = [];

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //setting the colors for the cards
    SellerItemsBackgroundColor.add(const Color(0xFFFFF7F3));
    SellerItemsBackgroundColor.add(const Color(0xFFFAD0C4));
    SellerItemsBackgroundColor.add(const Color(0xFFE6B2BA));
    SellerItemsBackgroundColor.add(const Color(0xFFC599B6));
  }

  @override
  Widget build(BuildContext context) {
    List<Seller> sellers = ModalRoute.of(context)!.settings.arguments as List<Seller>;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 44.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFFF8E9C), Color(0xFFD60A23)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                    child: Text(
                      "ForeverFusion",
                      style: GoogleFonts.irishGrover(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white, // Needed for ShaderMask
                      ),
                    ),
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // List of vendors
            Column(
              children: sellers
              .map((e) => SellerItem(seller: e, backgroundColor: SellerItemsBackgroundColor[sellers.indexOf(e) % 4],))
        .toList(),
        )

          ],
        ),
      ),
    );
  }
}
