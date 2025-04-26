import 'package:dine_dealer/features/pages/log_in/log_in_page.dart';
import 'package:get/get.dart';

class Navigation {
  static const initial = Routes.logIn;

  static final List<GetPage> pages = [
    GetPage(
      name: Routes.logIn,
      page: () => const LogInPage(),
    ),
  ];
}

abstract class Routes {
  static const logIn = '/logIn';
}