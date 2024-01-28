import 'package:flutter/material.dart';
import 'package:smd/theme/colors.dart';

class SnackbarService {
  static showSMDSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _buildSnackbar(
        message: message,
        backgroundColor: orangeClr.withOpacity(0.8),
      ),
    );
  }

  static SnackBar _buildSnackbar({
    required String message,
    Color backgroundColor = orangeClr,
  }) {
    return SnackBar(
      elevation: 8,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.up,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      backgroundColor: backgroundColor.withOpacity(0.72),
      behavior: SnackBarBehavior.fixed,
      content: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
