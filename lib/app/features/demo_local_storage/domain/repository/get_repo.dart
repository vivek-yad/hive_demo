import 'package:hive_demo/app/features/demo_local_storage/data/data_source/data_source_interface/local/local_interface_hive_db/interface_db.dart';

import '../../data/model/user.dart';
import '../../data/repository_impl/local_db_repo_impl/abstract_repo/abstratc_repo.dart';
import '../entities/user_data.dart';
import '../use_cases/get_user_list/abstract_get_user.dart';

class GetUsersUseCaseImpl implements GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCaseImpl(this.repository);

  @override
  Future<List<UserEntity>> call() async {
    return await repository.getUsers();
  }
}