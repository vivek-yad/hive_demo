// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_demo/app/features/demo_local_storage/presentaion/getx_controller/handle_hive_local_data/info_controller.dart';

class InfoScreen extends StatelessWidget {
   InfoScreen({Key? key}) : super(key: key);

  var ctrl =Get.put(InfoScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: (){ctrl.addInfo("name", "Raj");},
              child: const Text('Add'),
            ),
            ElevatedButton(
              onPressed: (){ctrl.getInfo("name", );},
              child: const Text('Get'),
            ),
            ElevatedButton(
              onPressed:(){ctrl.updateInfo("name", "Raj");},
              child: const Text('Update'),
            ),
            ElevatedButton(
              onPressed:  (){ctrl.deleteInfo("name",);},
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );

    return GetX<InfoScreenController>(
      builder: (ctrl) {
        return Scaffold(

          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: (){ctrl.addInfo("name", "Raj");},
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: (){ctrl.getInfo("name", );},
                  child: const Text('Get'),
                ),
                ElevatedButton(
                  onPressed:(){ctrl.updateInfo("name", "Raj");},
                  child: const Text('Update'),
                ),
                ElevatedButton(
                  onPressed:  (){ctrl.deleteInfo("name",);},
                  child: const Text('Delete'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
