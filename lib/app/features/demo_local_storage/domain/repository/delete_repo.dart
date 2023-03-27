import '../../data/repository_impl/local_db_repo_impl/abstract_repo/abstratc_repo.dart';
import '../use_cases/delete_use_cases/delete_use_case.dart';

class DeleteUserUseCaseImpl implements DeleteUserUseCase {
  final UserRepository repository;

  DeleteUserUseCaseImpl( this.repository);

  @override
  Future<void> call(int id) async {
    await repository.deleteUser(id);
  }
}
