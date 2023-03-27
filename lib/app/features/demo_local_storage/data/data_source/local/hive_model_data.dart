import 'package:hive/hive.dart';

class HiveStorageModel {
  static Box box = Hive.box("peopleBox");

  static addInfo(model) async {
    print("====================key=model value=$model");
    // Add info to people box
    box.add(model);
  }

  static getInfo(key) {
    // Get info from people box
    print("get=========$key");
    return box.get(key);
  }

  static updateInfo(key, value) {
    print("update=========$key=====$value");
    return box.put(key, value);
  }

  static deleteInfo(key) {
    print("delete================$key");
    return box.delete(key);
    // Delete info from people box
  }
}
