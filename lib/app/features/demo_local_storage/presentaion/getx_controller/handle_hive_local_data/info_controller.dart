import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/app/features/demo_local_storage/data/model/person.dart';

import '../../../data/repository_impl/repositories_impl.dart';
import 'package:flutter/services.dart';

class InfoScreenController extends GetxController {
  var repo = RepositoryImpl();
  var text = TextEditingController().obs;
  var data = "".obs;
  final nameController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final personFormKey = GlobalKey<FormState>().obs;
  final newPerson = Person(name: "", country: "").obs;
  final  _batteryChannel = MethodChannel('samples.flutter.dev/battery').obs;

  @override
  onInit() async {
    super.onInit();
    int? batteryLevel = await getBatteryLevel();
    print('Battery level is $batteryLevel%.');
    Hive.registerAdapter(PersonAdapter());
    await Hive.openBox('peopleBox');

  }

  String? fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  addInfo(key, value) async {
    newPerson.value = Person(
        name: nameController.value.text, country: countryController.value.text);
    var data = await repo.crateDb(key, newPerson.value);
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
  Future<int?> getBatteryLevel() async {
    int? batteryLevel;
    try {
      final int result = await _batteryChannel.value.invokeMethod('getBatteryLevel');

      batteryLevel = result;
    } on PlatformException catch (e) {
      batteryLevel = null;
      print("Failed to get battery level: '${e.message}'.");
    }
    update();
    return batteryLevel;
  }
}
