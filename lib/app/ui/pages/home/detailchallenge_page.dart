import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retotok/app/controller/detailchallenge_controller.dart';
import 'package:retotok/app/routes/pages.dart';
import 'package:video_player/video_player.dart';

class DetailChallengePage extends GetView<DetailChallengeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailChallengeController>(
      builder: (detChallCntl) {
        return Obx(
          () => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () async {
                  await Get.offAndToNamed(Routes.HOME);
                },
              ),
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: detChallCntl.image.value.isNotEmpty
                        ? NetworkImage(detChallCntl.image.value)
                        : const AssetImage('assets/images/default_user.jpeg'),
                    radius: 20,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    detChallCntl.nameUser.value,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              centerTitle: false,
              elevation: 0,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Título grande centrado
                      const Text(
                        'Título del Desafío',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Subtítulo más pequeño
                      const Text(
                        'Este es el subtítulo del desafío',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Video con relación de aspecto 9:16
                      Obx(() {
                        // Observamos el controlador de video
                        return detChallCntl.videoPlayerController.value !=
                                    null &&
                                detChallCntl.videoPlayerController.value!.value
                                    .isInitialized
                            ? AspectRatio(
                                aspectRatio: 4 / 5,
                                child: VideoPlayer(
                                    detChallCntl.videoPlayerController.value!),
                              )
                            : const CircularProgressIndicator(); // Indicador de carga mientras se carga el video
                      }),
                      const SizedBox(height: 16),

                      // Detalles sobre el video
                      const Text(
                        'Aquí puedes añadir más detalles sobre el video. Explicaciones o cualquier información adicional relevante sobre el desafío que estás mostrando en el video.',
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
