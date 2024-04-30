import 'package:flutter/material.dart';
import 'package:hr/presentation/resources/color_manager.dart';
import 'package:hr/presentation/resources/styles_manager.dart';
import 'package:hr/presentation/resources/values_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s60,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF94437E),
            const Color(0xFF8A4477),
            const Color(0xFF7D799D),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius:
            BorderRadius.circular(AppSize.s11), // Adjust the radius as needed
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s10),
            ),
            backgroundColor: ColorManager.baseColor),
        child: Text(
          title,
          style: getSemiBoldInterStyle(
              color: ColorManager.white2, fontSize: AppSize.s18),
        ),
      ),
    );
  }
}
