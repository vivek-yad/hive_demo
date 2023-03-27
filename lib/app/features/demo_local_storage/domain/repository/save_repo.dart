import 'package:hive_demo/app/features/demo_local_storage/domain/use_cases/save_user_case/save_user_case.dart';

import '../../data/model/user.dart';
import '../../data/repository_impl/local_db_repo_impl/abstract_repo/abstratc_repo.dart';
import '../entities/user_data.dart';

class SaveUserUseCaseImpl implements SaveUserUseCase {
  final UserRepository repository;

  SaveUserUseCaseImpl(this.repository);

  @override
  Future<void> call(UserEntity user) async {
    await repository.saveUser(user);
  }
}