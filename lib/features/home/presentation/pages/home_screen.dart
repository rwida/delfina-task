import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/index.dart';
import '../../../../core/dependencies/dependency_init.dart';
import '../../../../core/ui/resources/app_pallete.dart';
import '../../../../core/ui/resources/app_size_boxes.dart';
import '../../../../core/ui/resources/app_sizes.dart';
import '../../data/models/request/get_random_photos_request_model.dart';
import '../bloc/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetRandomPhotosBloc _getRandomPhotosBloc = getIt<GetRandomPhotosBloc>();
  late Timer _timer;
  String? _imageUrl;
  List<String> _urlImages = [];
  int currentIndex = 0;
  Timer? _rewindTimer;
  bool isRewinding = false;
  bool showMessage = false;

  @override
  void initState() {
    super.initState();
    _startSendingEvents();
  }

  void _startSendingEvents() {
    isRewinding = false;
    setState(() {});
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      _getRandomPhotosBloc.add(
        GetRandomPhotosEventFetchEvent(
          getRandomPhotosRequestModel: GetRandomPhotosRequestModel(clientID: Constants.clientID, query: 'dolphin'),
        ),
      );
    });
  }

  void _stopSendingEvents() {
    _timer.cancel();
  }

  void _startRewindingImages() {
    if (_urlImages.isNotEmpty) {
      const interval = Duration(seconds: 2);

      _rewindTimer = Timer.periodic(interval, (Timer timer) {
        setState(() {
          if (currentIndex < _urlImages.length - 1) {
            currentIndex++;
          } else {
            _stopRewindingImages();
            showMessage = true;
            timer.cancel();
          }
        });
      });
    }
  }

  void _stopRewindingImages() {
    _rewindTimer?.cancel();
    _rewindTimer = null;
    if (showMessage == false) {
      Future.delayed(const Duration(seconds: 10)).then((value) => showNoMoreDolphinsMessage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetRandomPhotosBloc>(
      create: (context) => _getRandomPhotosBloc,
      child: BlocBuilder<GetRandomPhotosBloc, GetRandomPhotosState>(
        builder: (context, state) {
          if (state is GetRandomPhotosStateSuccess) {
            _imageUrl = state.getRandomPhotosResponseModel.urls?.full;
          }
          if (state is GetRandomPhotosRewindStateSuccess) {
            _urlImages = state.urlImages;
            _startRewindingImages();
          }
          return Scaffold(
            body: _buildBodyWidget(),
          );
        },
      ),
    );
  }

  Widget _buildBodyWidget() {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      children: <Widget>[
        32.heightBox,
        isRewinding ? _buildShowOldImagesWidget() : _buildShowNewImageWidget(),
        24.heightBox,
        _buildPlayAndPauseRowWidget(),
        12.heightBox,
        _buildRewindButtonWidget(),
        8.heightBox,
      ],
    );
  }

  Widget _buildShowNewImageWidget() {
    if (_imageUrl != null && _imageUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: _imageUrl!,
        useOldImageOnUrlChange: true,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }
    return Container();
  }

  Widget _buildShowOldImagesWidget() {
    if (_urlImages.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: _urlImages[currentIndex],
        useOldImageOnUrlChange: true,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }
    return Container();
  }

  void showNoMoreDolphinsMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text("Cannot remember any more dolphins."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPlayAndPauseRowWidget() {
    return Row(
      children: <Widget>[
        _buildPlayButtonWidget(),
        12.widthBox,
        _buildPauseButtonWidget(),
      ],
    );
  }

  Widget _buildPlayButtonWidget() => Expanded(child: ElevatedButton(style: _btnStyle(), onPressed: _startSendingEvents, child: const Text('Play')));

  Widget _buildPauseButtonWidget() => Expanded(child: ElevatedButton(style: _btnStyle(), onPressed: _stopSendingEvents, child: const Text('Pause')));

  Widget _buildRewindButtonWidget() => ElevatedButton(style: _btnStyle(), onPressed: isRewinding ? null : _rewindEventOnTap, child: const Text('Rewind'));

  void _rewindEventOnTap() {
    setState(() {
      isRewinding = !isRewinding;
      _urlImages.clear();
      currentIndex = 0;
    });

    if (isRewinding) {
      _getRandomPhotosBloc.add(
        GetRandomPhotosRewindEvent(
          getRandomPhotosRequestModel: GetRandomPhotosRequestModel(clientID: Constants.clientID, query: 'dolphin'),
        ),
      );
    } else {
      _stopRewindingImages();
    }
  }

  ButtonStyle _btnStyle() => ElevatedButton.styleFrom(backgroundColor: AppPalette.lightBlue);

  @override
  void dispose() {
    _stopSendingEvents();
    super.dispose();
  }
}
