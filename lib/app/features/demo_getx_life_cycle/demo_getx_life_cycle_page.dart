import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'demo_getx_life_cycle_ctrl.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final myController = Get.find<MyController>();
    final myController = Get.put(MyController());

    /// final myController=Get.lazyPut(() => MyController());

    return Scaffold(
      body: Center(
        child: Obx(
          () => Text('MyWidget====${myController.text.value}'),
        ),
      ),
    );
  }
}
