part of 'freezed_data_cubit.dart';

@freezed
class FreezedDataState with _$FreezedDataState {
  const factory FreezedDataState.initial() = _Initial;
  const factory FreezedDataState.loading() = _Loading;
  const factory FreezedDataState.loaded(PostModel data) = _Loaded;
  const factory FreezedDataState.error() = _Error;
}
