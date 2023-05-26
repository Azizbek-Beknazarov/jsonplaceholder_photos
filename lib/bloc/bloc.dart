import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_photos/model/photos_model.dart';
import 'package:jsonplaceholder_photos/service/api_client.dart';

part 'event.dart';

part 'state.dart';

class PhotosBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotosBloc() : super(const PhotoState(list: [])) {
    on<GetPhotosEvent>(_getHandler);
  }

  Future<void> _getHandler(
    GetPhotosEvent event,
    Emitter<PhotoState> emit,
  ) async {
    final response = await ApiClient.instance.fetchPhotos();
    emit(state.copyWith(
      list: response,
    ));
  }
}
