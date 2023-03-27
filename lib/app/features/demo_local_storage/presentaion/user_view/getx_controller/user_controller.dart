import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_demo/app/features/demo_local_storage/domain/repository/delete_repo.dart';

import '../../../data/model/user.dart';
import '../../../domain/entities/user_data.dart';
import '../../../domain/repository/get_repo.dart';
import '../../../domain/repository/save_repo.dart';
import '../../../domain/repository/update.dart';
import '../../../domain/use_cases/delete_use_cases/delete_use_case.dart';
import '../../../domain/use_cases/get_user_list/abstract_get_user.dart';
import '../../../domain/use_cases/save_user_case/save_user_case.dart';

class UserController extends GetxController {
  final _getUsersUseCase = Get.find<GetUsersUseCaseImpl>();
  final _saveUserUseCase = Get.find<SaveUserUseCaseImpl>();
  final _updateUserUseCase = Get.find<UpdateUsecaseImpl>();
  final _deleteUserUseCase = Get.find<DeleteUserUseCaseImpl>();
  final _personFormKey = GlobalKey<FormState>().obs;

  late final _nameController=''.obs;
  late final _countryController=''.obs;


  final users = RxList<UserEntity>([]);
  final name = RxString('');
  final age = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      update();
      return 'Field can\'t be empty';
    }
    update();
    return null;
  }



  Future<void> getUsers() async {
    final users = await _getUsersUseCase();
    print("get user list");
    this.users.assignAll(users);
    update();
  }

  Future<void> addUser() async {
    var date=DateTime.now().microsecondsSinceEpoch;
    final user = UserEntity(name: name.value, age: age.value, id:date );
    print("get user list");
    await _saveUserUseCase(user);
    getUsers();
    update();
  }
  Future<void> updateUser(int id,UserEntity user) async {
    var date=DateTime.now().microsecondsSinceEpoch;
   // final user = UserEntity(name: name.value, age: age.value, id:date );
    print("get user list");
    await _updateUserUseCase( id,user);
    getUsers();
    update();
  }
  Future<void> deleteUser(int id) async {
    await _deleteUserUseCase(id);
    getUsers();
    update();
  }
}
