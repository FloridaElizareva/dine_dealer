class FavouriteModel {
  FavouriteModel({
    required this.name,
    required this.address,
     this.rating,
     this.reviews,
  });

  final String name;
  final String address;
  final double? rating;
  final int? reviews;
}
