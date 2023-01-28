import 'package:assignment_app/views/addfriend.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../controller/sql_helper.dart';

class FriendApp extends StatefulWidget {
  const FriendApp({super.key});

  @override
  State<FriendApp> createState() => _FriendAppState();
}

class _FriendAppState extends State<FriendApp> {
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    Fluttertoast.showToast(msg: "Successfuly Deleted");
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    _refreshJournals();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Friends App"),
          centerTitle: true,
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _journals.isEmpty
                ? const Center(
                    child: Text(
                    "No Data Found",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ))
                : ListView.builder(
                    itemCount: _journals.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.to(() => AddFriend(
                            id: _journals[index]['id'], iseditable: true)),
                        child: Card(
                            elevation: 2,
                            color: Colors.white,
                            margin: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.edit),
                                            onPressed: () => Get.to(() =>
                                                AddFriend(
                                                    id: _journals[index]
                                                        ['id'])),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () => _deleteItem(
                                                _journals[index]['id']),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Text(
                                          _journals[index]['name'],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Text(
                                          _journals[index]['mobile'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromARGB(
                                                  255, 49, 48, 48)),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    }),
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.add),
          onPressed: () => Get.to(() => const AddFriend(id: null)),
        ));
  }
}
