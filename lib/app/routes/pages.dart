import 'package:get/get.dart';
import 'package:retotok/app/binding/detailchallenge_binding.dart';
import 'package:retotok/app/binding/home_binding.dart';
import 'package:retotok/app/binding/login_binding.dart';
import 'package:retotok/app/middleware/auth_middleware.dart';
import 'package:retotok/app/ui/pages/home/detailchallenge_page.dart';
import 'package:retotok/app/ui/pages/home/home_page.dart';
import 'package:retotok/app/ui/pages/login/login_page.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.DETAILCHALLENGE,
      page: () => DetailChallengePage(),
      binding: DetailChallengeBinding(),
      transition: Transition.zoom,
      middlewares: [AuthMiddleware()],
    ),
  ];
}
