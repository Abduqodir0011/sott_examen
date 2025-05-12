import 'package:sott_examen/core/client.dart';
import 'package:sott_examen/data/model/home_model.dart';

class HomeRepository {
  HomeRepository({required this.client});

  final ApiClient client;
  List<HomeModel> products = [];

  Future<List<HomeModel>> fetchProducts() async {
    var rawProducts = await client.fetchProducts();
    products =
        rawProducts.map((product) => HomeModel.fromJson(product)).toList();
    return products;
  }
}
