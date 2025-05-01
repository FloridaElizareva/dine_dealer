import 'package:dine_dealer/features/data/repositories/favourites_repositories.dart';
import 'package:dine_dealer/features/data/repositories/log_in_repository.dart';
import 'package:dine_dealer/features/domain/controllers/favourites_controller.dart';
import 'package:dine_dealer/features/domain/controllers/log_in_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

void inject() {
  Get.put(FlutterSecureStorage(), permanent: true);
  Get.lazyPut(() => LogInRepository(), fenix: true);
  Get.lazyPut(() => FavouritesRepositories(), fenix: true);
  Get.lazyPut(
    () => LogInController(
      fss: Get.find<FlutterSecureStorage>(),
      logInRepository: Get.find<LogInRepository>(),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => FavouritesController(
      fss: Get.find<FlutterSecureStorage>(),
      favouritesRepository: Get.find<FavouritesRepositories>(),
    ),
    fenix: true,
  );
}
