part of 'bloc.dart';

class PhotoState extends Equatable {
  final List<PhotosModel> list;

  const PhotoState({
    required this.list,
  });

  PhotoState copyWith({
    List<PhotosModel>? list,
  }) {
    return PhotoState(
      list: list ?? this.list,
    );
  }

  @override
  List<Object?> get props => [list];
}
