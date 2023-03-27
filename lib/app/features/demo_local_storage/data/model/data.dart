import 'package:hive/hive.dart';
part 'data.g.dart';

@HiveType(typeId: 1)
class DataUser {
  @HiveType(typeId: 0)
  int? id;
  @HiveType(typeId: 1)
  String? name;
  @HiveType(typeId:2)
  int ?age;

  DataUser({this.id, this.name, this.age});


}
