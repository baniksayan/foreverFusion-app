import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/seller.dart';

class ServerHandler {
  final String _baseUrl = "http://127.0.0.1/forever_fusion/api/gen/sellers.php"; 

  // Get the list of sellers
  Future<List<Seller>> getSellers() async {
    try {
      List<Seller> sellers = [];
      final response = await http.get(Uri.parse('$_baseUrl/sellers.php'));

      if (response.statusCode == 200) {
        List sellersList = (json.decode(response.body))['sellers'];
        for (Map m in sellersList) {
          sellers.add(Seller.fromMap(m));
        }
      } else {
        throw Exception('Failed to load sellers');
      }

      return sellers;
    } catch (e) {
      print('Server Handler : error : $e');
      rethrow;
    }
  }
}
