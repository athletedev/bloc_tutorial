import 'package:bloc_course_dev/data_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());

  Future<void> fetchData() async {
    emit(DataLoading());
    try {
      final response = await Dio()
          .get('https://my-json-server.typicode.com/typicode/demo/posts/3');
      emit(DataLoaded(response.data));
    } catch (e) {
      emit(DataError());
    }
  }
}
