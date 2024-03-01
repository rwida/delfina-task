import 'package:equatable/equatable.dart';

import '../../data/models/response/get_random_photos_response_model.dart';

abstract class GetRandomPhotosState extends Equatable {
  const GetRandomPhotosState();

  @override
  List<Object> get props => <Object>[];
}

class GetRandomPhotosStateUninitialized extends GetRandomPhotosState {}

class GetRandomPhotosStateStateLoading extends GetRandomPhotosState {}

class GetRandomPhotosStateSuccess extends GetRandomPhotosState {
  const GetRandomPhotosStateSuccess({required this.getRandomPhotosResponseModel});
  final GetRandomPhotosResponseModel getRandomPhotosResponseModel;
  @override
  List<Object> get props => <Object>[getRandomPhotosResponseModel];
}

class GetRandomPhotosRewindStateSuccess extends GetRandomPhotosState {
  const GetRandomPhotosRewindStateSuccess({required this.urlImages});
  final List<String> urlImages;
  @override
  List<Object> get props => <Object>[urlImages];
}

class GetRandomPhotosStateFailed extends GetRandomPhotosState {
  const GetRandomPhotosStateFailed({required this.error});
  final String? error;

  @override
  List<Object> get props => <Object>[error!];
}
