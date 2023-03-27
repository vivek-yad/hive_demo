import '../../entities/user_data.dart';

abstract class UpdateUseCase{
  Future<void> call(int id, UserEntity user);
}