import 'dart:convert';

import 'package:dine_dealer/core/constants/urls.dart';
import 'package:dine_dealer/core/failures/failure.dart';
import 'package:dine_dealer/features/domain/models/auth_model.dart';
import 'package:dine_dealer/features/domain/models/favourite_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class FavouritesRepositories {
  Future<Either<Failure, List<FavouriteModel>>> getFavourites(String token) async {
    //return Right([]);
    try {
      final response = await Dio().get(
        Urls.favourites,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      //print(response);

      final data = response.data['favorites'] as List;

      final favourites = data.map((item) {
        return FavouriteModel(
          name: item['name'],
          address: item['address'],
          rating: item['rating'],
          reviews: item['reviews'],
        );
      }).toList();

      return Right(favourites);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Left(
          Failure(
            null,
            'No Internet',
          ),
        );
      }

      return Left(
        Failure(
          e.response!.statusCode,
          e.response!.data['error'],
        ),
      );
    }
  }
}
