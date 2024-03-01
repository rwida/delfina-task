import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum PaletteType { light, dark }

class PaletteModel {
  const PaletteModel(
      {required this.primary,
      required this.secondary,
      required this.accent,
      required this.text,
      required this.textDark,
      required this.textMedium,
      required this.textLight,
      required this.textWhite,
      required this.textDisabled,
      required this.surface,
      required this.background,
      required this.border,
      required this.borderLight,
      required this.borderLighter,
      required this.notificationUnread,
      required this.error,
      required this.skeleton,
      required this.success,
      required this.alert,
      required this.darkGreen,
      required this.lightBlue,
      required this.rangeOfDaysColor});
  final Color? primary;
  final Color? secondary;
  final Color? surface;
  final Color? background;
  final Color? accent;
  final Color? text;
  final Color? textDark;
  final Color? textMedium;
  final Color? textLight;
  final Color? textWhite;
  final Color? textDisabled;
  final Color? border;
  final Color? borderLight;
  final Color? borderLighter;
  final Color? notificationUnread;
  final Color? error;
  final Color? skeleton;
  final Color? success;
  final Color? alert;
  final Color? rangeOfDaysColor;
  final Color? darkGreen;
  final Color? lightBlue;
}

class AppPalette {
  static const MaterialColor kUnfoundedColor = Colors.red;
  static PaletteType paletteType = PaletteType.light;

  static void changeStatusColor(Color? statusBarColor) {
    return SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  static const PaletteModel _lightPalette = PaletteModel(
      primary: Color(0xFF3A68D1),
      secondary: Color(0xFF3873f3),
      accent: Color(0x544475DF),
      text: Color(0xFF2e445d),
      textDark: Color(0xFF222222),
      textMedium: Color(0xFF98a3af),
      textLight: Color(0xFF6b7893),
      textWhite: Color(0xFFFFFFFF),
      textDisabled: Color(0xffe1e4e9),
      border: Color(0xffe1e4ea),
      borderLight: Color(0xFF989898),
      borderLighter: Color(0xFB989898),
      surface: Color(0xFFFFFFFF),
      background: Color(0xFFF8F8F8),
      notificationUnread: Color(0x11EE4340),
      error: Color(0xFFFF0400),
      skeleton: Color(0xFFF1F1F1),
      success: Color(0xFF16CA05),
      alert: Color(0xFFFD8A25),
      darkGreen: Color(0xff028759),
      lightBlue: Color(0xffE6EDFF),
      rangeOfDaysColor: Color(0xFFFFB72A));

  static Map<PaletteType, PaletteModel> _palette = {
    PaletteType.light: _lightPalette,
  };

  static Color get primaryColor {
    return _palette[AppPalette.paletteType]?.primary ?? kUnfoundedColor;
  }

  static Color get secondaryColor {
    return _palette[AppPalette.paletteType]?.secondary ?? kUnfoundedColor;
  }

  static Color get accentColor {
    return _palette[AppPalette.paletteType]?.accent ?? kUnfoundedColor;
  }

  static Color get textColor {
    return _palette[AppPalette.paletteType]?.text ?? kUnfoundedColor;
  }

  static Color get textDarkColor {
    return _palette[AppPalette.paletteType]?.textDark ?? kUnfoundedColor;
  }

  static Color get textMediumColor {
    return _palette[AppPalette.paletteType]?.textMedium ?? kUnfoundedColor;
  }

  static Color get textLightColor {
    return _palette[AppPalette.paletteType]?.textLight ?? kUnfoundedColor;
  }

  static Color get textWhiteColor {
    return _palette[AppPalette.paletteType]?.textWhite ?? kUnfoundedColor;
  }

  static Color get textDisabledColor {
    return _palette[AppPalette.paletteType]?.textDisabled ?? kUnfoundedColor;
  }

  static Color get borderColor {
    return _palette[AppPalette.paletteType]?.border ?? kUnfoundedColor;
  }

  static Color get borderLightColor {
    return _palette[AppPalette.paletteType]?.borderLight ?? kUnfoundedColor;
  }

  static Color get borderLighterColor {
    return _palette[AppPalette.paletteType]?.borderLighter ?? kUnfoundedColor;
  }

  static Color get surfaceColor {
    return _palette[AppPalette.paletteType]?.surface ?? kUnfoundedColor;
  }

  static Color get backgroundColor {
    return Colors.grey[100]!;
  }

  static Color get notificationUnreadColor {
    return _palette[AppPalette.paletteType]?.notificationUnread ?? kUnfoundedColor;
  }

  static Color get errorColor {
    return _palette[AppPalette.paletteType]?.error ?? kUnfoundedColor;
  }

  static Color get dangerColor {
    return const Color(0xFFDD3A2A);
  }

  static Color get alertColor {
    return _palette[AppPalette.paletteType]?.alert ?? kUnfoundedColor;
  }

  static Color get skeletonColor {
    return _palette[AppPalette.paletteType]?.skeleton ?? kUnfoundedColor;
  }

  static Color get successColor {
    return _palette[AppPalette.paletteType]?.success ?? kUnfoundedColor;
  }

  static Color get rangeDaysColor {
    return _palette[AppPalette.paletteType]?.rangeOfDaysColor ?? kUnfoundedColor;
  }

  static Color get darkGreen {
    return _palette[AppPalette.paletteType]?.darkGreen ?? kUnfoundedColor;
  }

  static Color get lightBlue {
    return _palette[AppPalette.paletteType]?.lightBlue ?? kUnfoundedColor;
  }

  static Color get greenE0F1EB {
    return const Color(0xFFE0F1EB);
  }

  static Color get greenB3DBCE {
    return const Color(0xFFB3DBCE);
  }

  static Color get green00875A {
    return const Color(0xFF00875A);
  }

  static Color get redFBE9E7 {
    return const Color(0xFFFBE9E7);
  }

  static Color get redDD3A2A {
    return const Color(0xFFDD3A2A);
  }

  static Color get redDEC9188 {
    return const Color(0xFFEC9188);
  }

  static Color get blue172E63 {
    return const Color(0xFF172E63);
  }

  static Color get white {
    return Colors.white;
  }

  static Color get blackColor {
    return const Color(0xFF000000);
  }

  static Color get transparentColor {
    return Colors.transparent;
  }

  static Color get primary50 {
    return const Color(0xFFE2E9F8);
  }

  static Color get primary100 {
    return const Color(0xFFC6D3F2);
  }

  static Color get primary200 {
    return const Color(0xFF3A68D1);
  }

  static Color get primary300 {
    return const Color(0xFF2953B2);
  }

  static Color get primary500 {
    return const Color(0xFF172E63);
  }

  static Color get grey100 {
    return Colors.grey[100]!;
  }

  static Color get grey200 {
    return const Color(0xFFEDEFF1);
  }

  static Color get grey300 {
    return const Color(0xFFCECECE);
  }

  static Color get grey400 {
    return const Color(0xFF798693);
  }

  static Color get grey500 {
    return const Color(0xFF697682);
  }

  static Color get grey800 {
    return const Color(0xFF3E454D);
  }

  static Color get grey900 {
    return Colors.grey[900]!;
  }
}
