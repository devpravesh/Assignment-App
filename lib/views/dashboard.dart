import 'package:assignment_app/controller/dashboardcontroller.dart';
import 'package:assignment_app/views/currency.dart';
import 'package:assignment_app/views/hoqwartcharacters.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _controller = Get.put(DashboardController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: (() {
              _controller.fetchcode();
            }),
            child: const Text("Fetch"),
          )
        ],
        title: const Text("Dashboard"),
        centerTitle: true,
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.smart_toy_outlined), text: "Hoqwarts"),
            Tab(icon: Icon(Icons.currency_exchange_rounded), text: "Currency")
          ],
        ),
      ),
      body: TabBarView(children: [HoqwartsCharacter(), Currency()]),
    );
  }
}
