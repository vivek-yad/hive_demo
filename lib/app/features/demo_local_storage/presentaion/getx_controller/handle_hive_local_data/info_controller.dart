import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../data/repository_impl/repositories_impl.dart';

class InfoScreenController extends GetxController {
  var repo = RepositoryImpl();
  var text = TextEditingController().obs;
  var data = "".obs;

  @override
  onInit() async {
    super.onInit();
  //  Hive.registerAdapter(PersonAdaptor());
    await Hive.openBox('peopleBox');
  }

  addInfo(key, value) async {
    var data = await repo.crateDb(key, value);
  }

  getInfo(key) async {
    var data = await repo.getData(key);
    print('Info retrieved from box:  $data');
  }

  updateInfo(key, value) async {
    var data = await repo.updateData(key, value);
    print('Info updated in box!');
  }

  deleteInfo(key) async {
    var data = await repo.deleteData(key);
    print('Info deleted from box!');
  }
}
