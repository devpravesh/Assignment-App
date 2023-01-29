import 'dart:convert';

import 'package:assignment_app/controller/dashboardcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  final _controller = Get.find<DashboardController>();
  final fromTextController = TextEditingController();
  List<String>? currencies;
  String fromCurrency = "USD";
  String toCurrency = "GBP";
  String? result;

  @override
  void initState() {
    super.initState();
    // _loadCurrencies();
  }

  Future<String> _loadCurrencies() async {
    String uri =
        "https://v6.exchangerate-api.com/v6/ef90923589e16cbb2995f9ff/codes";
    var response =
        await http.get(Uri.parse(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    Map curMap = responseBody['supported_codes'];
    currencies = curMap.keys.cast<String>().toList();
    setState(() {});
    print(currencies);
    return "Success";
  }

  void _doConversion(var value) async {
    // https://v6.exchangerate-api.com/v6/ef90923589e16cbb2995f9ff/pair/EUR/GBP/1
    String uri =
        "https://v6.exchangerate-api.com/v6/ef90923589e16cbb2995f9ff/pair/USD/INR/$value";
    var response =
        await http.get(Uri.parse(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    setState(() {
      result = responseBody["conversion_result"].toString();
    });
    print(result);
    // return "Success";
  }

  _onFromChanged(String value) {
    setState(() {
      fromCurrency = value;
    });
  }

  _onToChanged(String value) {
    setState(() {
      toCurrency = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    //_controller.codes[0].supportedCodes![2][0].toString()
    return Scaffold(
      body:
          // currencies == null
          //     ? Center(child: CircularProgressIndicator())
          //     :
          Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ListTile(
                    title: TextField(
                      // controller: fromTextController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Amount"),
                      onChanged: (value) {
                        fromTextController.text = value;
                      },
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                    trailing: Text("USD")
                    // _buildDropDownButton(fromCurrency),
                    ),
                GestureDetector(
                  onTap: () => _doConversion(fromTextController.text),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),

                    // ),
                  ),
                ),
                ListTile(
                    title: Chip(
                      label: result != null
                          ? Text(
                              "Rs. $result",
                            )
                          : Text(""),
                    ),
                    trailing: Text("INR")
                    // _buildDropDownButton(toCurrency),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropDownButton(String currencyCategory) {
    return DropdownButton(
      value: currencyCategory,
      items: currencies!
          .map((String value) => DropdownMenuItem(
                value: value,
                child: Row(
                  children: <Widget>[
                    Text(value),
                  ],
                ),
              ))
          .toList(),
      onChanged: (String? value) {
        if (currencyCategory == fromCurrency) {
          _onFromChanged(value!);
        } else {
          _onToChanged(value!);
        }
      },
    );
  }
}
