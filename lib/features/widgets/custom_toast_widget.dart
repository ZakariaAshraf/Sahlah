import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToastWidget {
  static void show({
    required BuildContext context,
    required String title,
    required String iconPath,
    Color? iconBackgroundColor,
    Color? backgroundColor,
    Duration? autoCloseDuration,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.simple,
      title: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: iconBackgroundColor ?? const Color(0xFF8D1B3D),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: iconPath.toLowerCase().endsWith('.svg')
                  ? Image.asset(
                      iconPath,
                      width: 16,
                      height: 16,
                    )
                  : Image.asset(
                      iconPath,
                      width: 16,
                      height: 16,
                    ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: autoCloseDuration ?? const Duration(seconds: 4),
      backgroundColor: backgroundColor ?? (isDark ? const Color(0xFF2A2A2A) : const Color(0xFFFFEFE8)),
      margin: EdgeInsets.only(
        top: 650,
        left: 60,
        right: 60,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      borderRadius: BorderRadiusGeometry.all(Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
      closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
    );
  }
}
