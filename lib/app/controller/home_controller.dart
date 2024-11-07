import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:retotok/app/data/model/challenge.dart';
import 'package:retotok/app/data/repository/home_repository.dart';

class HomeController extends GetxController {
  RxString email = RxString("");
  RxString nameUser = RxString("");
  RxString uid = RxString("");
  RxString image = RxString("");

  RxString challengeCompleted = RxString("");
  RxString accumulatedPoints = RxString("");
  RxInt idUser = RxInt(0);
  RxList<ActiveChallenges> templistChallenge = <ActiveChallenges>[].obs;

  HomeRepository homeRepository = HomeRepository();
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getGmailData();
    getChallengesList();
  }

  Future<void> getGmailData() async {
    final storage = GetStorage();
    email.value = storage.read('email');
    nameUser.value = storage.read('name');
    image.value = storage.read('image');
    getdataUser();
  }

  Future<void> getdataUser() async {
    final storage = GetStorage();
    idUser.value = storage.read('isUser');

    final bodyraw = await homeRepository.getDataUser(idUser.value);
    challengeCompleted.value = bodyraw["challenge_completed"].toString();
    accumulatedPoints.value = bodyraw["accumulated_points"].toString();
  }

  Future<void> getChallengesList() async {
    templistChallenge.value = await homeRepository.getChallengesList();
  }
}
