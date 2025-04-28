import 'package:dine_dealer/core/failures/failure.dart';
import 'package:dine_dealer/features/data/repositories/favourites_repositories.dart';
import 'package:dine_dealer/features/domain/models/favourite_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class FavouritesControlller extends GetxController {
  FavouritesControlller({
    required this.fss,
    required this.favouritesRepository,
  });

  final FlutterSecureStorage fss;
  final FavouritesRepositories favouritesRepository;
  Failure? favouritesFailure;

  List<FavouriteModel> favourites = [];

  Future<void> getFavourites() async {
    final token = FlutterSecureStorage().read(key: 'token').toString();
    final lor = await FavouritesRepositories().getFavourites(token);

    if (lor.isRight) {
      favourites = lor.right;
    } else {
      favouritesFailure = lor.left;
    }

    update();
  }
}
