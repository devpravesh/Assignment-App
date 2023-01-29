import 'dart:developer';

import 'package:assignment_app/model/hoqwartsModel.dart';
import 'package:assignment_app/services/services.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  List<HoqwartsModel> hoqwartsres = <HoqwartsModel>[].obs;
  @override
  void onInit() {
    fetchcharacter();
    super.onInit();
  }

  void fetchcharacter() async {
    var res = await ApiProvider.fetchhoqwartsList();
    log('test $res');
    if (res != null) {
      // log(res.toString());
      hoqwartsres.addAll(res);
    }
  }
}
