class BookingModel {
  BookingModel({
    required this.selectedRestaurantName,
    required this.bookedDateTime,
    required this.address,
    required this.guestsCount,
    //this.phone,
    //this.createdAt,

  });
  
  final String selectedRestaurantName;
  final String? bookedDateTime;
  final int guestsCount;
  final String address;
  //final String? phone;
  //final String? createdAt;
  
}
