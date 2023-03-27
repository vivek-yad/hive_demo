import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx_controller/handle_hive_local_data/info_controller.dart';

class AddInfo extends StatelessWidget {
   AddInfo({Key? key}) : super(key: key);
  var ctrl =Get.put(InfoScreenController());


  @override
  Widget build(BuildContext context) {
    return Form(
      key: ctrl.personFormKey.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name'),
          TextFormField(
            controller: ctrl.nameController.value,
            validator: (str){ctrl.fieldValidator(str);},
          ),
          SizedBox(height: 24.0),
          Text('Home Country'),
          TextFormField(
            controller: ctrl.countryController.value,
            validator:(str){ctrl.fieldValidator(str);},
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (ctrl.personFormKey.value.currentState!.validate()) {
                    ctrl.addInfo(null,null);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Add'),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
