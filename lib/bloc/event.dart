part of 'bloc.dart';

abstract class PhotoEvent extends Equatable {}

class GetPhotosEvent extends PhotoEvent {
  GetPhotosEvent();

  @override
  List<Object?> get props => [];
}
