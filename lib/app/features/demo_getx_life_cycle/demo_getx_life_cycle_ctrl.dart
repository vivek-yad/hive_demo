import 'package:get/get.dart';

class MyController extends GetxController {
   RxString text="hello".obs;
  @override
  void onInit() {
    // Called when the widget is first created
    super.onInit();
    print('MyController onInit');
  }

  @override
  void onReady() {
    // Called when the widget is fully initialized and ready to be used
    super.onReady();
    print('MyController onReady');
    text.value="de";
    update();
  }

  @override
  void onClose() {
    // Called when the widget is removed from the widget tree
    super.onClose();
    print('MyController onClose');
  }

  @override
  void onPause() {
    // Called when the widget is moved to the background
  //  super.onPause();
    print('MyController onPause');
    text.value="fffff";
    update();
  }

  @override
  void onResume() {
    // Called when the widget is brought back to the foreground
  //  super.onResume();
    print('MyController onResume');
    text.value="dddd";
    print("fffff");
    update();
  }

}