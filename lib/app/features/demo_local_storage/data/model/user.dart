import 'package:hive/hive.dart';
import 'package:hive_demo/app/features/demo_local_storage/domain/entities/user_data.dart' as user;
part 'user.g.dart';
@HiveType(typeId: 2)
class User {

  @HiveType(typeId: 0)
  int? id;
  @HiveType(typeId: 1)
  String? name;
  @HiveType(typeId:2)
  int ?age;

  User({this.id, this.name, this.age});

  factory User.fromEntity(user.UserEntity user) {
    return User(
      id: user.id,
      name: user.name,
      age: user.age,
    );
  }

  user.UserEntity toEntity() {
    return user.UserEntity(id: id, name: name, age: age);
  }
}
