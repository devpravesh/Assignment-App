import 'package:assignment_app/controller/dashboardcontroller.dart';
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
            return Text('${_controller.hoqwartsres[index].name}');
          },
        ));
  }
}
