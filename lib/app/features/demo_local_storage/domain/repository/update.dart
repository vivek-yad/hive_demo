import 'package:hive_demo/app/features/demo_local_storage/data/repository_impl/local_db_repo_impl/repo_interface/interface_of_repo.dart';
import 'package:hive_demo/app/features/demo_local_storage/domain/entities/user_data.dart';

import '../../data/repository_impl/local_db_repo_impl/abstract_repo/abstratc_repo.dart';
import '../use_cases/update_use_cases/update_use_case.dart';

class UpdateUsecaseImpl implements UpdateUseCase{
 final UserRepository userRepo;
  UpdateUsecaseImpl(this.userRepo);

  @override
  Future<void> call(int id, UserEntity user) async {
    await userRepo.updateUser(id, user);
  }
}