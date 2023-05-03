abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final Map<String, dynamic> data;

  DataLoaded(this.data);
}

class DataError extends DataState {}
