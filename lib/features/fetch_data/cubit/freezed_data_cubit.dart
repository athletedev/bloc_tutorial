import 'package:bloc/bloc.dart';
import 'package:bloc_course_dev/features/fetch_data/data/data_repository.dart';
import 'package:bloc_course_dev/features/fetch_data/models/post_model/post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_state.dart';
part 'freezed_data_cubit.freezed.dart';

class FreezedDataCubit extends Cubit<FreezedDataState> {
  FreezedDataCubit(this._dataRepository)
      : super(const FreezedDataState.initial());

  final DataRepository _dataRepository;

  Future<void> fetchData(String id) async {
    emit(const FreezedDataState.loading());
    try {
      final response = await _dataRepository.fetchData(id);
      emit(FreezedDataState.loaded(response));
    } catch (e) {
      emit(const FreezedDataState.error());
    }
  }
}
