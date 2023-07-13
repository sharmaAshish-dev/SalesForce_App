import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/ui/decorators/decorators.dart';
import '../values/values.dart';

class Themes {
  static ThemeData lightTheme = lightThemeData(lightColorScheme);

  static ThemeData darkTheme = darkThemeData(darkColorScheme);

  static ThemeData lightThemeData(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      textTheme: ThemeData.light().textTheme.apply(fontFamily: GoogleFonts.figtree().fontFamily, displayColor: black, bodyColor: black),
      canvasColor: colorScheme.background,
      iconTheme: const IconThemeData(color: textColourLight),
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.tertiary),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colorScheme.primary,
          statusBarIconBrightness: colorScheme.brightness,
          statusBarBrightness: colorScheme.brightness,
        ),
      ),
      radioTheme: RadioThemeData(fillColor: MaterialStateColor.resolveWith((states) => colorScheme.secondary)),
      checkboxTheme: CheckboxThemeData(fillColor: MaterialStateColor.resolveWith((states) => colorScheme.secondary)),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.background,
        disabledColor: grey,
        selectedColor: colorScheme.primary,
        secondarySelectedColor: colorScheme.primary,
        labelStyle: const TextStyle(color: black),
        secondaryLabelStyle: const TextStyle(color: white),
        brightness: Brightness.light,
        padding: const EdgeInsets.all(Sizes.PADDING_8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
        selectionColor: colorScheme.secondary.withOpacity(0.4),
        selectionHandleColor: colorScheme.secondary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_20, vertical: Sizes.PADDING_16),
        alignLabelWithHint: true,
        labelStyle: TextStyle(color: colorScheme.primary, fontSize: Sizes.TEXT_SIZE_14),
        hintStyle: const TextStyle(color: grey),
        fillColor: colorScheme.surfaceTint,
        focusColor: colorScheme.primary,
        hoverColor: colorScheme.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: colorScheme.outline,
            width: Sizes.WIDTH_1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: colorScheme.outline,
            width: Sizes.WIDTH_1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: Sizes.WIDTH_1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: Sizes.WIDTH_1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: Sizes.WIDTH_1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: grey,
            width: Sizes.WIDTH_1,
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: colorScheme.background,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        surfaceTintColor: colorScheme.surfaceTint,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateColor.resolveWith((states) => colorScheme.secondary),
        trackColor: MaterialStateColor.resolveWith((states) => colorScheme.surfaceTint),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: colorScheme.surfaceTint,
        dialBackgroundColor: colorScheme.surfaceTint,
        hourMinuteTextColor: colorScheme.primary,
        hourMinuteColor: colorScheme.primary,
        dayPeriodTextColor: colorScheme.primary,
        dayPeriodColor: colorScheme.primary,
        dialHandColor: colorScheme.primary,
        dialTextColor: colorScheme.primary,
        entryModeIconColor: colorScheme.primary,
        hourMinuteTextStyle: const TextStyle(color: black, fontSize: Sizes.TEXT_SIZE_24),
        dayPeriodTextStyle: const TextStyle(color: black, fontSize: Sizes.TEXT_SIZE_24),
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        fillColor: colorScheme.surfaceTint,
        selectedColor: colorScheme.primary,
        color: colorScheme.primary,
        textStyle: const TextStyle(color: black),
        borderRadius: BorderRadius.circular(borderRadius),
        constraints: const BoxConstraints(minHeight: Sizes.HEIGHT_40),
        borderWidth: Sizes.WIDTH_1,
        borderColor: colorScheme.outline,
      ),
      brightness: colorScheme.brightness,
      dialogBackgroundColor: colorScheme.surface,
      disabledColor: grey,
      dividerColor: greyLight,
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.surfaceTint,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      colorScheme: colorScheme,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        splashColor: colorScheme.secondary,
        hoverColor: colorScheme.secondary,
        focusColor: colorScheme.secondary,
      ),
    );
  }

  //darkThemeData
  static ThemeData darkThemeData(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: GoogleFonts.figtree().fontFamily,
            displayColor: white,
            bodyColor: white,
          ),
      canvasColor: colorScheme.background,
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.tertiary),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colorScheme.primary,
          statusBarIconBrightness: colorScheme.brightness,
          statusBarBrightness: colorScheme.brightness,
        ),
      ),
      radioTheme: RadioThemeData(fillColor: MaterialStateColor.resolveWith((states) => colorScheme.secondary)),
      checkboxTheme: CheckboxThemeData(fillColor: MaterialStateColor.resolveWith((states) => colorScheme.secondary)),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.background,
        disabledColor: greyLight,
        selectedColor: colorScheme.primary,
        secondarySelectedColor: colorScheme.primary,
        labelStyle: const TextStyle(color: white),
        secondaryLabelStyle: const TextStyle(color: white),
        brightness: colorScheme.brightness,
        padding: const EdgeInsets.all(Sizes.PADDING_8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
        selectionColor: colorScheme.secondary.withOpacity(0.4),
        selectionHandleColor: colorScheme.secondary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(Sizes.PADDING_12),
        alignLabelWithHint: true,
        hintStyle: const TextStyle(color: grey),
        labelStyle: TextStyle(color: colorScheme.primary, fontSize: Sizes.TEXT_SIZE_14),
        fillColor: colorScheme.surfaceTint,
        focusColor: colorScheme.primary,
        hoverColor: colorScheme.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: grey,
            width: Sizes.WIDTH_1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: grey,
            width: Sizes.WIDTH_1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: Sizes.WIDTH_1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: Sizes.WIDTH_1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: Sizes.WIDTH_1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: grey,
            width: Sizes.WIDTH_1,
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: colorScheme.background,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        surfaceTintColor: colorScheme.surfaceTint,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateColor.resolveWith((states) => colorScheme.secondary),
        trackColor: MaterialStateColor.resolveWith((states) => colorScheme.surfaceTint),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: colorScheme.surfaceTint,
        dialBackgroundColor: colorScheme.surfaceTint,
        hourMinuteTextColor: colorScheme.primary,
        hourMinuteColor: colorScheme.primary,
        dayPeriodTextColor: colorScheme.primary,
        dayPeriodColor: colorScheme.primary,
        dialHandColor: colorScheme.primary,
        dialTextColor: colorScheme.primary,
        entryModeIconColor: colorScheme.primary,
        hourMinuteTextStyle: const TextStyle(color: black, fontSize: Sizes.TEXT_SIZE_24),
        dayPeriodTextStyle: const TextStyle(color: black, fontSize: Sizes.TEXT_SIZE_24),
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        fillColor: colorScheme.surfaceTint,
        selectedColor: colorScheme.primary,
        color: colorScheme.primary,
        textStyle: const TextStyle(color: black),
        borderRadius: BorderRadius.circular(borderRadius),
        constraints: const BoxConstraints(minHeight: Sizes.HEIGHT_40),
        borderWidth: Sizes.WIDTH_1,
        borderColor: colorScheme.outline,
      ),
      brightness: colorScheme.brightness,
      dialogBackgroundColor: colorScheme.surface,
      disabledColor: grey,
      dividerColor: offWhite,
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.surfaceTint,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      iconTheme: const IconThemeData(color: textColourDark),
      colorScheme: colorScheme,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        splashColor: colorScheme.secondary,
        hoverColor: colorScheme.secondary,
        focusColor: colorScheme.secondary,
      ),
    );
  }

  static ColorScheme lightColorScheme = ColorScheme(
    primary: primaryLight,
    secondary: secondaryLight,
    background: white,
    surface: offWhite,
    onBackground: offWhite,
    error: errorRed.withOpacity(0.6),
    onError: errorRed,
    onPrimary: primaryLight,
    onSecondary: secondaryLight,
    onSurface: offWhite,
    brightness: Brightness.light,
    surfaceTint: white,
    outline: black,
    tertiary: accentLight,
  );

  static ColorScheme darkColorScheme = ColorScheme(
    primary: primaryDark,
    secondary: secondaryDark,
    background: black.withOpacity(0.8),
    surface: black,
    onBackground: black,
    error: errorRed.withOpacity(0.6),
    onError: errorRed,
    onPrimary: primaryDark,
    onSecondary: secondaryDark,
    onSurface: black,
    brightness: Brightness.dark,
    surfaceTint: black.withOpacity(0.1),
    outline: white,
    tertiary: accentDark,
  );

  static final systemOrientation = SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
