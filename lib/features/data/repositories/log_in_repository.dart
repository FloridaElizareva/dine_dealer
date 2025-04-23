import 'dart:convert';

import 'package:dine_dealer/core/constants/urls.dart';
import 'package:dine_dealer/core/failures/failure.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class LogInRepository {
  Future<Either<Failure, String>> logIn(String phone, {String? code}) async {
    final Map<String, String> data = {
      'phone': phone,
    };

    if (code != null) {
      data['code'] = code;
    }

    try {
      final response = await Dio().post(Urls.login, data: data);

      return Right(response.data['message']);
    } on DioException catch (e) {
      return Left(Failure(e.response?.statusCode, e.response!.data['error']));
    }
  }
}
