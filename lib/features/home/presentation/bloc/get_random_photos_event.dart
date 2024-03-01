import 'package:equatable/equatable.dart';

import '../../data/models/request/get_random_photos_request_model.dart';

abstract class GetRandomPhotosEvent extends Equatable {
  const GetRandomPhotosEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetRandomPhotosEventFetchEvent extends GetRandomPhotosEvent {
  const GetRandomPhotosEventFetchEvent({required this.getRandomPhotosRequestModel});

  final GetRandomPhotosRequestModel getRandomPhotosRequestModel;

  @override
  List<Object> get props => <Object>[getRandomPhotosRequestModel];
}

class GetRandomPhotosRewindEvent extends GetRandomPhotosEvent {
  const GetRandomPhotosRewindEvent({required this.getRandomPhotosRequestModel});
  final GetRandomPhotosRequestModel getRandomPhotosRequestModel;

  @override
  List<Object> get props => <Object>[getRandomPhotosRequestModel];
}
