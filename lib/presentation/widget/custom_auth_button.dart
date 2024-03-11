import 'package:flutter/material.dart';
import 'package:hr/presentation/resources/color_manager.dart';
import 'package:hr/presentation/resources/styles_manager.dart';
import 'package:hr/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    Key? key,
    required this.isLoading,
    this.onTap,
    required this.buttonName,
  }) : super(key: key);

  final bool isLoading;
  final VoidCallback? onTap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : SizedBox(
      height: AppSize.s8.h,
      width: double.infinity,
      child: Container(
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
          borderRadius: BorderRadius.circular(AppSize.s11), // Adjust the radius as needed
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent), // Make button background transparent
            shadowColor: MaterialStateProperty.all(Colors.transparent), // Remove shadow
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s11),
              ),
            ),
          ),
          onPressed: onTap,
          child: Ink( // Use Ink for InkWell effect on custom container
            child: Center(
              child: Text(
                buttonName,
                style: getMediumInterStyle(
                  color: ColorManager.whiteTwo,
                  fontSize: AppSize.s18.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
