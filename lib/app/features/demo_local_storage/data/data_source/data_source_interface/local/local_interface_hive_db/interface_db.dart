import 'package:hive/hive.dart';
import '../../../../../domain/entities/user_data.dart';
import '../../../../data_source_abstract/abstract_data_source.dart';
import '../../../../model/user.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
 final Box<User> _box;
  UserLocalDataSourceImpl(this._box);

 // final _box = Hive.box('users');

  @override
  Future<List<UserEntity>> getUsers() async {
    final userModels = _box.values.toList();
    final users = userModels.map((userModel) => userModel.toEntity()).toList();
    return users;
    // final users = _box.values.toList() ;
    // return users;
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    final userModel = User.fromEntity(user);
    print("userrrrr id ${userModel.id}");
    _box.add(userModel);
    //await _box.put(userModel.id, userModel);
  }

  @override
  Future<void> deleteUser(int id) async {
    //await _box.delete(id);
   await _box.deleteAt(id);
  }

  @override
  Future<void> updateUser(int id, UserEntity user) async {
    final userModel = User.fromEntity(user);
    _box.putAt(id, userModel);
  }
}