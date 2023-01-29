import 'dart:developer';

import 'package:assignment_app/controller/dashboardcontroller.dart';
import 'package:assignment_app/views/characterdetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoqwartsCharacter extends StatelessWidget {
  HoqwartsCharacter({super.key});
  final DashboardController _controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: _controller.hoqwartsres.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => CharacterDetail(index: index));
              },
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        _controller.hoqwartsres[index].image.toString()),
                  ),
                  subtitle: Text('${_controller.hoqwartsres[index].actor}'),
                  title: Text('${_controller.hoqwartsres[index].name}')),
            );
          },
        ));
  }
}
