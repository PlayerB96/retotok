import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retotok/app/controller/home_controller.dart';
import 'package:retotok/app/ui/global_widgets/cardChallenge.dart';
import 'package:retotok/app/ui/global_widgets/drawer.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCntl) {
      return Obx(
        () => Scaffold(
          endDrawer: drawer(
              nameConductor: homeCntl.nameUser.value,
              phoneConductor: homeCntl.email.value,
              imageUser: homeCntl.image.value),
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: homeCntl.image.value.isNotEmpty
                      ? NetworkImage(homeCntl.image.value)
                      : const AssetImage('assets/images/default_user.jpeg'),
                  radius: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  homeCntl.nameUser.value,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    // padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.90,
                          height: MediaQuery.sizeOf(context).width * 0.30,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 6,
                                color: Color(0x4B1A1F24),
                                offset: Offset(
                                  0.0,
                                  2,
                                ),
                              )
                            ],
                            gradient: const LinearGradient(
                              colors: [Color(0xFF00968A), Color(0xFFF2A384)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0.94, -1),
                              end: AlignmentDirectional(-0.94, 1),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(homeCntl.email.value),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'Retos Cumplidos',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 236, 233, 233),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            homeCntl.challengeCompleted.value
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Puntos Acumulados',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 236, 233, 233),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            homeCntl.accumulatedPoints.value
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Generated code for this Text Widget...

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Retos Activos',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  Obx(
                    () => SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.6, // Ajusta el tamaño según lo necesario
                      child: ListView.builder(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                        itemCount: homeCntl.templistChallenge.length,
                        itemBuilder: (context, transactionListIndex) {
                          final challenge =
                              homeCntl.templistChallenge[transactionListIndex];

                          // Calcular la diferencia de tiempo
                          final now = DateTime.now();
                          final difference =
                              challenge.challengeTime.difference(now);
                          String timeToComplete;

                          if (difference.inDays > 0) {
                            timeToComplete =
                                '${difference.inDays} días restantes';
                          } else if (difference.inHours > 0) {
                            timeToComplete =
                                '${difference.inHours} horas restantes';
                          } else {
                            timeToComplete = 'Tiempo agotado';
                          }

                          return cardChallenge(
                            challenge: challenge,
                            context: context,
                            challengeType: challenge.challengeType,
                            challengePoints: challenge.challengePoints,
                            challengeName: challenge.challengeName,
                            challengeTimeHour:
                                timeToComplete, // Actualización aquí
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
