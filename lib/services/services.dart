import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:assignment_app/model/hoqwartsModel.dart';

class ApiProvider {
  static final client = http.Client();
  final String _hoqwartsurl =
      'https://hp-api.onrender.com/api/characters/students';

  static Future fetchhoqwartsList() async {
    try {
      var response = await client
          .get(Uri.https("hp-api.onrender.com", '/api/characters/students'))
          .timeout(Duration(seconds: 8));
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        print(jsonBody);
        return HoqwartsModel.fromJson(jsonBody);
        // }
      } else {
        return HoqwartsModel.withError(
            '{"message": "Some Error Occured", "status": "false", "status_code": 0}');
      }
      //
    } on SocketException {
      return HoqwartsModel.withError(
          '{"message": "Sorry, You don\'t have internet connection.", "status": "false", "status_code": 0}');
    } on FormatException {
      Fluttertoast.showToast(msg: "Something went wrong in format");
    } on TimeoutException {
      log("TimeOut Exception");
    }
  }
// }
}
