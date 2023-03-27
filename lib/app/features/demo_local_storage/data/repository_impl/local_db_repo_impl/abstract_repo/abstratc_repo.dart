

import '../../../../domain/entities/user_data.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
  Future<void> saveUser(UserEntity user);
  Future<void> updateUser(int  id,UserEntity user);
  Future<void> deleteUser(int id);
}