import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_demo/app/features/demo_local_storage/presentaion/user_view/getx_controller/user_controller.dart';
import 'package:hive_demo/app/features/demo_local_storage/presentaion/user_view/view/update.dart';

import '../widgets/add_user_view.dart';
import '../widgets/update_user.dart';

class UserListWidget extends StatelessWidget {
  final UserController controller = Get.find<UserController>();

  // final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];
              return InkWell(
                onTap: () {
                  Get.to(
                    () => UpdateScreen(index: index, person: user),
                  );
                },
                child: ListTile(
                  title: Text(user?.name ?? ''),
                  subtitle: Text('Age: ${user?.age ?? 0}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => controller.deleteUser(index),
                  ),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddUserView()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
