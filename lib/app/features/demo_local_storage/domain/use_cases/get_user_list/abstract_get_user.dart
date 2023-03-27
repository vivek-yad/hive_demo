import 'package:hive_demo/app/features/demo_local_storage/data/data_source_abstract/abstract_data_source.dart';

import '../../../data/model/user.dart';
import '../../entities/user_data.dart';

abstract class GetUsersUseCase {


  Future<List<UserEntity>> call();
}
