import '../../entities/user_data.dart';

abstract class SaveUserUseCase {
  Future<void> call(UserEntity user);
}