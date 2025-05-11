 class HomeModel {
    final int id;
    final String category;
    final String image;
    final int price;
    final String currency;
    final num area;
    final int numOfRooms;
    final int totalFloors;
    final int floor;
    final HomePopularPlace nearestPopularPlace;

    HomeModel({
      required this.id,
      required this.category,
      required this.image,
      required this.price,
      required this.currency,
      required this.area,
      required this.numOfRooms,
      required this.totalFloors,
      required this.floor,
      required this.nearestPopularPlace,
    });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      category: json['category'],
      image: json['image'],
      price: json['price'],
      currency: json['currency'],
      area: json['area'],
      numOfRooms: json['numOfRooms'],
      totalFloors: json['totalFloors'],
      floor: json['floor'],
      nearestPopularPlace: HomePopularPlace.fromJson(json['nearestPopularPlace'] as Map<String, dynamic>),
    );
  }
}
class HomePopularPlace {
  final String title;
  final int distance;
  final String image;

  HomePopularPlace({
  required this.title,
  required this.distance,
  required this.image,
  });

  factory HomePopularPlace.fromJson(Map<String, dynamic> json) {
    return HomePopularPlace(
      title: json['title'] as String,
      distance: json['distance'] as int,
      image: json['image'] as String,
    );
  }
}