import '../../domain/entities/user_data.dart';


abstract class UserLocalDataSource {
  Future<List<UserEntity>> getUsers();
  Future<void> saveUser(UserEntity user);
  Future<void> deleteUser(int id);
  Future<void>updateUser(int id,UserEntity user);
}