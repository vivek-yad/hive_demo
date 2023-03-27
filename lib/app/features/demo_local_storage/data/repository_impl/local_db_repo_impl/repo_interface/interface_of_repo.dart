import 'package:hive_demo/app/features/demo_local_storage/data/repository_impl/local_db_repo_impl/abstract_repo/abstratc_repo.dart';

import '../../../../domain/entities/user_data.dart';
import '../../../data_source_abstract/abstract_data_source.dart';
import '../../../model/user.dart';


class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({ required this.localDataSource});

  @override
  Future<List<UserEntity>> getUsers() async {
    return await localDataSource.getUsers();
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    await localDataSource.saveUser(user);
  }

  @override
  Future<void> deleteUser(int id) async {
    await localDataSource.deleteUser(id);
  }

  @override
  Future<void> updateUser(int id, UserEntity user) async {
    await localDataSource.updateUser(id, user);
  }

}