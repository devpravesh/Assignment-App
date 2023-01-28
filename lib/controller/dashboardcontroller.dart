import 'dart:developer';

import 'package:assignment_app/model/hoqwartsModel.dart';
import 'package:assignment_app/services/services.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var hoqwartsres = [].obs;
  @override
  void onInit() {
    fetchcharacter();
    super.onInit();
  }

  void fetchcharacter() async {
    var res = await ApiProvider.fetchhoqwartsList();
    if (res != null) {
      // log(res.toString());
      hoqwartsres.assign(res);
      log(res.toString());
      print(hoqwartsres.toString());
    }
  }
}
