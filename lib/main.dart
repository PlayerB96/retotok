import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:retotok/app/binding/login_binding.dart';
import 'package:retotok/app/routes/pages.dart';
import 'package:retotok/app/ui/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
      initialBinding: LoginBinding(),
      theme: appThemeDataLight,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      builder: (context, myWidget) {
        myWidget = EasyLoading.init()(context, myWidget);
        return myWidget;
      },
    ),
  );
}
