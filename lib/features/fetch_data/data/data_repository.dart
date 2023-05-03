import 'package:bloc_course_dev/features/fetch_data/data/remote_data_source.dart';
import 'package:bloc_course_dev/features/fetch_data/models/post_model/post_model.dart';

class DataRepository {
  final RemoteDataSource _remoteDataSource;

  DataRepository(this._remoteDataSource);

  Future<PostModel> fetchData(String id) async {
    try {
      final response = await _remoteDataSource.fetchData(id);
      final data = PostModel.fromJson(response);
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
