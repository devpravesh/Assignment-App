import 'dart:developer';

import 'package:assignment_app/model/codesmodel.dart';
import 'package:assignment_app/model/hoqwartsModel.dart';
import 'package:assignment_app/services/services.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  List<HoqwartsModel> hoqwartsres = <HoqwartsModel>[].obs;
  List<CodesModel> codes = <CodesModel>[].obs;
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

  void fetchcode() async {
    var res = await ApiProvider.fetchhCodesList();
    log('test $res');
    if (res != null) {
      // log(res.toString());
      codes.assign(res);
      log(codes.toString());
    }
  }
}
