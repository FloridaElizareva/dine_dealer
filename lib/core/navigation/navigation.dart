import 'package:dine_dealer/features/pages/enter_code_page/enter_code_page.dart';
import 'package:dine_dealer/features/pages/favourites/favourites_page.dart';
import 'package:dine_dealer/features/pages/favourites/widgets/loading.dart';
import 'package:dine_dealer/features/pages/favourites/widgets/no_favourites.dart';
import 'package:dine_dealer/features/pages/home/home_page.dart';
import 'package:dine_dealer/features/pages/log_in/log_in_page.dart';
import 'package:dine_dealer/features/pages/onboarding/onboarding_page.dart';
import 'package:dine_dealer/features/pages/onboarding/onboarding2_page.dart';
import 'package:get/get.dart';

class Navigation {
  static var initial = Routes.home;

  static final List<GetPage> pages = [
    GetPage(
      name: Routes.logIn,
      page: () => const LogInPage(),
    ),
    GetPage(
      name: Routes.enterCode,
      page: () => const EnterCodePage(),
    ),
    GetPage(
      name: Routes.onboarding1,
      page: () => const Onboarding(),
    ),
    GetPage(
      name: Routes.onboarding2,
      page: () => const Onboarding2(),
    ),
    GetPage(
      name: Routes.favourites,
      page: () => const FavouritesPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.loading,
      page: () => const Loading(),
    ),
    GetPage(
      name: Routes.noFavourites,
      page: () => const NoFavourites(),
    ),
  ];
}

abstract class Routes {
  static const logIn = '/logIn';
  static const enterCode = '/enterCode';
  static const onboarding1 = '/onboarding1';
  static const onboarding2 = '/onboarding2';
  static const favourites = '/favourites';
  static const home = '/home';
  static const loading = '/loading';
  static const noFavourites = '/noFavourites';
}