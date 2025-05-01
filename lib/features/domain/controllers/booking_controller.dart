import 'package:dine_dealer/core/failures/failure.dart';
import 'package:dine_dealer/features/data/repositories/booking_repositories.dart';
import 'package:dine_dealer/features/domain/models/booking_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class BookingController extends GetxController{
  
  BookingController({
    required this.fss,
    required this.bookingRepository,
  });

  final FlutterSecureStorage fss;
  final BookingRepositories bookingRepository;
  Failure? favouritesFailure;

  List<BookingModel> booking = [];
 
  Future<void> getBooking() async {
    final token = await fss.read(key: 'token');
    final lor = await bookingRepository.getBookingUpcoming(token.toString());

    if (lor.isRight) {
      booking = lor.right;
    } else {
      favouritesFailure = lor.left;
    }

    update();
  }
}

