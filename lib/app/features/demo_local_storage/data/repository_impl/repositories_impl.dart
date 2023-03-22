import 'package:hive_demo/app/features/demo_local_storage/data/data_source/local/hive_local_storage.dart';
import 'package:hive_demo/app/features/demo_local_storage/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  @override
  crateDb(key, value) async {
    // TODO: implement crateDb
    return await HiveStorage.addInfo(key, value);
  }

  @override
  deleteData(key) async {
    return await HiveStorage.deleteInfo(key);
  }

  @override
  getData(key) async {
    return await HiveStorage.getInfo(key);
  }

  @override
  updateData(key, value) async {
    return await HiveStorage.updateInfo(key, value);
  }
}
