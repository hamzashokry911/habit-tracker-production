import 'package:flutter/material.dart';
import 'package:styleguide/src/tokens/typography.dart';
import 'package:styleguide/style.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.pink,
        ),
        primaryColor: AppColors.orange,
        scaffoldBackgroundColor: Colors.white,
        textTheme: AppTypography.lightTextTheme,
        buttonTheme: _buttonTheme(),
      );

  static ThemeData get darkTheme => ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.pink,
        ),
        primaryColor: AppColors.darkerGrey,
        scaffoldBackgroundColor: AppColors.darkGrey,
        textTheme: AppTypography.darkTextTheme,
        canvasColor: AppColors.darkerGrey,
        splashColor: AppColors.grey.withValues(alpha: 0.1),
        highlightColor: AppColors.grey.withValues(alpha: 0.1),
        appBarTheme: _appBarTheme(),
        bottomNavigationBarTheme: _bottomNavigationBarTheme(),
        tabBarTheme: _tabBarTheme(),
        bottomAppBarTheme: _bottomAppBarTheme(),
        iconTheme: const IconThemeData(color: AppColors.grey),
        iconButtonTheme: _iconButtonTheme(),
        buttonTheme: _buttonTheme(),
        textButtonTheme: _textButtonTheme(),
        elevatedButtonTheme: _elevatedButtonTheme(),
        bottomSheetTheme: _bottomSheetTheme(),
        dialogTheme: _dialogTheme(),
        dividerTheme: _dividerTheme(),
        listTileTheme: _listTileTheme(),
      );

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.darkerGrey,
      actionsIconTheme: IconThemeData(color: AppColors.grey),
      iconTheme: IconThemeData(color: AppColors.orange),
    );
  }

  static BottomNavigationBarThemeData _bottomNavigationBarTheme() {
    return const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.darkerGrey,
      selectedItemColor: AppColors.orange,
      unselectedItemColor: AppColors.grey,
    );
  }

  static TabBarThemeData _tabBarTheme() {
    return const TabBarThemeData(
      unselectedLabelColor: AppColors.grey,
      labelPadding: EdgeInsets.symmetric(horizontal: Dimens.size12),
      indicator: UnderlineTabIndicator(
        insets: EdgeInsets.symmetric(horizontal: Dimens.size08),
        borderSide: BorderSide(
          width: Dimens.size02,
          color: AppColors.orange,
        ),
      ),
    );
  }

  static BottomAppBarThemeData _bottomAppBarTheme() {
    return const BottomAppBarThemeData(
      color: AppColors.darkerGrey,
    );
  }

  static IconButtonThemeData _iconButtonTheme() {
    return IconButtonThemeData(
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        foregroundColor: WidgetStateProperty.all<Color>(Colors.pink),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.orange),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          AppShapes.circularBorder12,
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          AppTypography.varelaBold,
        ),
      ),
    );
  }

  static ButtonThemeData _buttonTheme() {
    return const ButtonThemeData(
      shape: AppShapes.circularBorder16,
      buttonColor: AppColors.lightOrange,
    );
  }

  static TextButtonThemeData _textButtonTheme() {
    return TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(Dimens.size12),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          AppTypography.varelaBold,
        ),
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.orange),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          AppShapes.circularBorder12,
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          AppTypography.varelaBold,
        ),
      ),
    );
  }

  static BottomSheetThemeData _bottomSheetTheme() {
    return const BottomSheetThemeData(
      backgroundColor: AppColors.darkerGrey,
    );
  }

  static DialogThemeData _dialogTheme() {
    return const DialogThemeData(
      backgroundColor: AppColors.darkerGrey,
      shape: AppShapes.circularBorder16,
      titleTextStyle: TextStyle(color: AppColors.grey),
      contentTextStyle: TextStyle(color: Colors.white),
    );
  }

  static DividerThemeData _dividerTheme() {
    return const DividerThemeData(
      space: 1,
      thickness: 1,
      color: AppColors.darkGrey,
    );
  }

  static ListTileThemeData _listTileTheme() {
    return const ListTileThemeData(
      iconColor: AppColors.grey,
      visualDensity: VisualDensity.compact,
      horizontalTitleGap: Dimens.size04,
    );
  }
}
