import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/helper/navigator.dart';
import '../../../core/ui/resources/app_sizes.dart';
import '../resources/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  // Animation Controllers
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // change status color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    //
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeOut);
    _animationController.forward();
    _animationController.addListener(() {
      if (_animationController.isCompleted) pushNameReplacement(context, AppRoute.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.backgroundColor,
      body: _buildScreen(),
    );
  }

  Widget _buildScreen() {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? snapshot) {
          return Transform.scale(
            scale: _animation.value,
            child: Image.asset(
              AppImages.delfinaLogo,
              width: 180.w,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
