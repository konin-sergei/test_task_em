import 'package:flutter/material.dart';

var theme = ThemeData(

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: accentColor,
    unselectedItemColor: bottomNavigationBarUnSelectColor,
    selectedLabelStyle: TextStyle(fontSize: 10),
    unselectedLabelStyle: TextStyle(fontSize: 10),
    backgroundColor: backgroundColor,
    elevation: 1,
  ),
  appBarTheme: const AppBarTheme(
    color: backgroundColor,
    elevation: 0,
    centerTitle: false,
  ),
  scaffoldBackgroundColor: backgroundColor,
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontFamily: mainFont,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontFamily: mainFont,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontFamily: mainFont,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: accentColor,
      shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
      elevation: 0,
      shadowColor: Colors.transparent,
    ),
  ),
);

// Fonts
const mainFont = 'SF Pro Display';

// Sizes:
// const double defaultPadding = 15.0;
const double borderRadius = 10.0;

// // Paddings:
// const EdgeInsets defaultAllPadding = EdgeInsets.all(defaultPadding);
//

// Borders:
BorderRadius defaultBorderRadius = BorderRadius.circular(borderRadius);

// Colors:
const Color backgroundColor = Colors.white;

const bottomNavigationBarUnSelectColor = Color(0xFFA5A9B2);
const accentColor = Color(0xFF3364E0);

const textColor = Colors.black;

// Widget elevatedButton(String text, VoidCallback? onTap, BuildContext context,
//     {bool? isLoading, String? error}) =>
//     SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                 (Set<MaterialState> states) {
//               if (states.contains(MaterialState.pressed)) {
//                 return hoverElevatedButtonColor;
//               } else if (states.contains(MaterialState.disabled)) {
//                 return disabledElevatedButtonColor;
//               }
//               return accentColor; // Use the component's default.
//             },
//           ),
//         ),
//         onPressed:
//         (isLoading != null && isLoading) || error != null ? null : onTap,
//         child: Padding(
//           padding: defaultAllPadding,
//           child: isLoading != null && isLoading
//               ? getCircularProgressIndicatorInButton(backgroundColor)
//               : Text(
//             text,
//             style: Theme.of(context).textTheme.headline5!.copyWith(
//               color: backgroundColor,
//             ),
//           ),
//         ),
//       ),
//     );
//
