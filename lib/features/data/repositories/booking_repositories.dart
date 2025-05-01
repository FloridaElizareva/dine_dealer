import 'dart:convert';
import 'package:dine_dealer/core/constants/urls.dart';
import 'package:dine_dealer/core/failures/failure.dart';
import 'package:dine_dealer/features/domain/models/booking_model.dart';
import 'package:dine_dealer/features/domain/models/favourite_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class BookingRepositories {
  Future<Either<Failure, List<BookingModel>>> getBookingUpcoming(String token) async {
    try {
      final response = await Dio().get(
        Urls.booking,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print(response);

      final data = response.data['booking'] as List;

      final booking = data.map((item) {
        return BookingModel(
          selectedRestaurantName: item['selected_restaurant_name'],
          bookedDateTime: item['booked_date_time'],
          address: item['selected_restaurant_address'],
          guestsCount: item['guests_count']
          //phone: item['selected_restaurant_phone'],
        );
      }).toList();

      return Right(booking);
    } on DioException catch (e) {
      return Left(
        Failure(
          e.response!.statusCode,
          e.response!.data['error'],
        ),
      );
    }
  }
}
