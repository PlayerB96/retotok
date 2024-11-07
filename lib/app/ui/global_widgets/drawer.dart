import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:retotok/app/routes/pages.dart';

Drawer drawer(
    {required String nameConductor,
    required String phoneConductor,
    required String imageUser}) {
  // Definir el array con los datos de cada elemento del Drawer
  final List<Map<String, dynamic>> drawerItems = [
    {
      'title': 'Salir',
      'icon': Icons.exit_to_app,
      'onTap': () async {
        final box = GetStorage();
        await box.erase();
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  ];

  return Drawer(
    backgroundColor: Colors.white,
    width: 260,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imageUser),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                nameConductor,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                phoneConductor,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9EA1B1),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: drawerItems.map((item) {
              return InkWell(
                onTap: item['onTap'],
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      width: 20,
                      height: 20,
                      child: Icon(item['icon']),
                    ),
                    Text(
                      item['title'],
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}
