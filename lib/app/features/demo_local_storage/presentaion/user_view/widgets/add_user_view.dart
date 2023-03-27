import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_demo/app/features/demo_local_storage/presentaion/user_view/getx_controller/user_controller.dart';

class AddUserView extends StatelessWidget {
  final UserController controller = Get.find<UserController>();

   AddUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) => controller.name.value = value,
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
              onChanged: (value) =>
                  controller.age.value = int.tryParse(value) ?? 0,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await controller.addUser();
                //Get.back;
                 Navigator.pop(context);
              },
              child: const Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }
}
