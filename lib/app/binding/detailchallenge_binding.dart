import 'package:get/get.dart';
import 'package:retotok/app/controller/detailchallenge_controller.dart';

class DetailChallengeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailChallengeController>(() => DetailChallengeController());
  }
}
