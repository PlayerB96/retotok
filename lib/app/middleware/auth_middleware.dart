import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    //VALIDACION SI TIENE PERMISO PARA ENTRAR
    final box = GetStorage();

    bool isLogged = box.read('isLogged') ?? false;
    print(isLogged);
    if (route != Routes.INITIAL) {
      // ignore: prefer_const_constructors
      return isLogged ? null : RouteSettings(name: Routes.INITIAL);
    } else {
      return isLogged ? const RouteSettings(name: Routes.HOME) : null;
    }
  }
}
