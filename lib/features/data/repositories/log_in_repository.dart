import 'dart:convert';

import 'package:dine_dealer/core/constants/urls.dart';
import 'package:dine_dealer/core/failures/failure.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class LogInRepository {
  Future<Either<Failure, String>> logIn(String phone) async {
    try {
      final response = await Dio().post(Urls.login, data: {'phone': phone});

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      }

      final failure = Failure(response.statusCode, response.data['error']);
      return Left(failure);
    } catch (e) {
      return Left(Failure(500, "Internal Server Error"));
    }
  }
}
