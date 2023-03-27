import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/app/features/demo_local_storage/data/data_source_abstract/abstract_data_source.dart';
import 'package:hive_demo/app/features/demo_local_storage/data/model/user.dart';
import 'package:hive_demo/app/features/demo_local_storage/data/repository_impl/local_db_repo_impl/abstract_repo/abstratc_repo.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'app/features/demo_getx_life_cycle/demo_getx_life_cycle_page.dart';
import 'app/features/demo_local_storage/data/data_source/data_source_interface/local/local_interface_hive_db/interface_db.dart';
import 'app/features/demo_local_storage/data/model/data.dart';
import 'app/features/demo_local_storage/data/repository_impl/local_db_repo_impl/repo_interface/interface_of_repo.dart';
import 'app/features/demo_local_storage/domain/repository/delete_repo.dart';
import 'app/features/demo_local_storage/domain/repository/get_repo.dart';
import 'app/features/demo_local_storage/domain/repository/save_repo.dart';
import 'app/features/demo_local_storage/domain/repository/update.dart';
import 'app/features/demo_local_storage/domain/use_cases/get_user_list/abstract_get_user.dart';
import 'app/features/demo_local_storage/domain/use_cases/save_user_case/save_user_case.dart';
import 'app/features/demo_local_storage/presentaion/user_view/getx_controller/user_controller.dart';
import 'app/features/demo_local_storage/presentaion/user_view/view/user_list_view.dart';
import 'app/features/demo_local_storage/presentaion/views/home_page/home_page.dart';
import 'app/features/demo_local_storage/presentaion/views/info_screen/info_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  ///Hive.registerAdapter(UserAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await  getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter((DataUserAdapter()));
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<DataUser>('data_user');
 final box= await Hive.openBox<User>('users');
  //final box = await Hive.openBox('users');
  final UserLocalDataSource userLocalDataSource=UserLocalDataSourceImpl(box);
  final userRepo=UserRepositoryImpl(localDataSource:userLocalDataSource );
  Get.put(GetUsersUseCaseImpl(userRepo));
  Get.put(SaveUserUseCaseImpl(userRepo));
  Get.put(UpdateUsecaseImpl(userRepo));
  Get.put(DeleteUserUseCaseImpl(userRepo));
  Get.put(UserRepositoryImpl(localDataSource: userLocalDataSource));
  Get.put(UserController());
 // final userDataSource = HiveUserDataSource(box);
  //final userRepository = UserRepositoryImpl(userDataSource);

  //Get.put<GetUsersUseCase>(GetUsersUseCase(userRepository));
  //Get.put<SaveUserUseCase>(SaveUserUseCase(userRepository));
  //Get.put<DeleteUserUseCase>(DeleteUserUseCase(userRepository));
  //Get.put<UserController>(UserController());

//   await Hive.initFlutter();
//   /// initialize the hive first
// //  Hive.registerAdapter(PersonAdapter());
//
//   ///
//   await Hive.openBox('peopleBox');
//   /// Open the peopleBdmoox
//
//   await initServices();
  ///Register the controller and setting the dependencies injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListWidget(),
    );
  }
}
// Future<void> initServices() async {
//   await Get.putAsync(() => Hive.initFlutter());
//  // await Get.putAsync(() => LocalStorageDataSource().init());
//   await Get.putAsync(() => UserRepositoryImpl().init());
//   await Get.putAsync(() => GetUsersUseCase());
//   await Get.putAsync(() => SaveUserUseCase());
//   await Get.putAsync(() => DeleteUserUseCase());
// }