import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sql_helper.dart';

class AddFriend extends StatefulWidget {
  final int? id;
  final bool? iseditable;
  const AddFriend({super.key, required this.id, this.iseditable});

  @override
  State<AddFriend> createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _mobileController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _landmarkController = TextEditingController();

  final TextEditingController _pincodeController = TextEditingController();
  List<Map<String, dynamic>> _journals = [];
  bool _isLoading = true;

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    // print(data);
    setState(() {
      _journals = data;
      _isLoading = false;
    });
    _formsdata(widget.id);
  }

  _formsdata(int? id) {
    if (id != null) {
      // print(_journals);
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _nameController.text = existingJournal['name'];
      _mobileController.text = existingJournal['mobile'];
      _addressController.text = existingJournal['address'];
      _landmarkController.text = existingJournal['landmark'];
      _pincodeController.text = existingJournal['pincode'];
    }
  }

  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _nameController.text,
        _mobileController.text,
        _addressController.text,
        _landmarkController.text,
        _pincodeController.text);
    _refreshJournals();
  }

  @override
  void initState() {
    _refreshJournals();

    super.initState();
  }

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id,
        _nameController.text,
        _mobileController.text,
        _addressController.text,
        _landmarkController.text,
        _pincodeController.text);
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.iseditable == true ? "Friend" : "Add Friend"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Name",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      TextFormField(
                        enabled: widget.iseditable == true ? false : true,
                        controller: _nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: "Enter Your Name"),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Mobile",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      TextFormField(
                        enabled: widget.iseditable == true ? false : true,
                        controller: _mobileController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: "Enter Mobile Number"),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Address",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      TextFormField(
                        enabled: widget.iseditable == true ? false : true,
                        controller: _addressController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: "Enter Address"),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Landmark",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      TextFormField(
                        enabled: widget.iseditable == true ? false : true,
                        controller: _landmarkController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: "Enter Landmark"),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Pincode",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      TextFormField(
                        enabled: widget.iseditable == true ? false : true,
                        controller: _pincodeController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: "Enter Pincode"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      if (widget.iseditable != true)
                        GestureDetector(
                          onTap: () async {
                            // Save new journal
                            if (widget.id == null) {
                              await _addItem();
                            }

                            if (widget.id != null) {
                              await _updateItem(widget.id!);
                            }

                            // Clear the text fields
                            _nameController.text = '';
                            _addressController.text = '';
                            _mobileController.text = '';
                            _landmarkController.text = '';
                            _pincodeController.text = '';

                            Get.back();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              border: Border(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                  child: Text(
                                      widget.id == null
                                          ? 'Add New Friend'
                                          : 'Update',
                                      style: const TextStyle(
                                          fontSize: 25, color: Colors.white))),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
