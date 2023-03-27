import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'app/features/demo_getx_life_cycle/demo_getx_life_cycle_page.dart';
import 'app/features/demo_local_storage/presentaion/views/home_page/home_page.dart';

Future<void> main() async {

  await Hive.initFlutter();
  /// initialize the hive first
//  Hive.registerAdapter(PersonAdapter());

  ///
  await Hive.openBox('peopleBox');
  /// Open the peopleBdmoox
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWidget(),
    );
  }
}
