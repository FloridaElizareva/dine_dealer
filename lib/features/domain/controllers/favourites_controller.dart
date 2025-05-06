import 'package:dine_dealer/core/failures/failure.dart';
import 'package:dine_dealer/features/data/repositories/favourites_repositories.dart';
import 'package:dine_dealer/features/domain/models/favourite_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  FavouritesController({
    required this.fss,
    required this.favouritesRepository,
  });

  final FlutterSecureStorage fss;
  final FavouritesRepositories favouritesRepository;
  Failure? favouritesFailure;
  bool isLoading = false;

  List<FavouriteModel> favourites = [];

  Future<void> getFavourites() async {
    isLoading = true;
    update();

    final token = await fss.read(key: 'token');
    final lor = await favouritesRepository.getFavourites(token.toString());

    if (lor.isRight) {
      favourites = lor.right;
      isLoading = false;
    } else {
      favouritesFailure = lor.left;
    }

    
    update();
  }
}
