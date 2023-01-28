import 'package:assignment_app/controller/dashboardcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class HoqwartsCharacter extends StatelessWidget {
  HoqwartsCharacter({super.key});
  final DashboardController _controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _controller.hoqwartsres.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Text(_controller.hoqwartsres[index][0].name.toString()),
            Text(_controller.hoqwartsres.length.toString())
          ],
        );
      },
    );
  }
}
