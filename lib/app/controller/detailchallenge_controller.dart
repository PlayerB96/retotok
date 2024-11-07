import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';

class DetailChallengeController extends GetxController {
  RxString email = RxString("");
  RxString nameUser = RxString("");
  RxString uid = RxString("");
  RxString image = RxString("");
  // Controlador de video
  Rxn<VideoPlayerController> videoPlayerController =
      Rxn<VideoPlayerController>();
  RxBool isVideoInitialized = false.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getGmailData();
    initializeVideo();
  }

  Future<void> getGmailData() async {
    final storage = GetStorage();
    email.value = storage.read('email');
    nameUser.value = storage.read('name');
    image.value = storage.read('image');
  }

  Future<void> initializeVideo() async {
    videoPlayerController.value = VideoPlayerController.networkUrl(
      Uri.parse(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    );

    // Inicializa el video y actualiza el estado de isVideoInitialized
    await videoPlayerController.value!.initialize().then((_) {
      isVideoInitialized.value = true;
      videoPlayerController.value!
          .play(); // Inicia el video automáticamente si es necesario
      update();
    }).catchError((error) {
      // Manejar cualquier error durante la carga del video
      print('Error al inicializar el video: $error');
    });
  }

  @override
  void onClose() {
    // Asegurarse de liberar los recursos del video
    videoPlayerController.value?.dispose();
    super.onClose();
  }
}
