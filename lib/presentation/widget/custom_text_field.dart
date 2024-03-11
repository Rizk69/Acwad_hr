import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr/presentation/resources/color_manager.dart';
import 'package:hr/presentation/resources/styles_manager.dart';
import 'package:hr/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAuthFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final String? labelText;
  final TextInputType keyboardType;
  final Iterable<String>? autofillHints;
  final void Function(String)? onFieldSubmitted;

  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final String? hintText;
  final String? upHintText;
  final String? suffixText;
  final String? errorText;
  final TextStyle? suffixTextStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? labelColor;
  final Color? cursorColor;
  final double radius;
  final double? height;
  final double horizontalPadding;
  final double verticalPadding;
  final InputBorder? inputBorder;
  final InputBorder? inputEnabledBorder;
  final InputBorder? inputFocusedBorder;
  final InputBorder? inputDisabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final AlignmentGeometry? containerAlignment;
  final BoxConstraints? suffixIconConstraints;
  final bool readOnly;
  final int? maxLength;
  final int? errorMaxLines;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? errorStyle;

  const CustomAuthFormFiled({
    Key? key,
    required this.controller,
    this.validator,
    this.onTap,
    this.labelText,
    required this.keyboardType,
    this.onFieldSubmitted,
    this.autofillHints,
    this.onEditingComplete,
    this.onChanged,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.hintText,
    this.upHintText,
    this.backgroundColor,
    this.height,
    this.radius = 30.0,
    // this.maxLines,
    this.enabled = true,
    this.inputBorder =
        const OutlineInputBorder(borderSide: BorderSide(width: 1)),
    this.inputEnabledBorder,
    this.inputFocusedBorder,
    this.inputDisabledBorder,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.textColor,
    this.labelColor = Colors.white,
    this.contentPadding,
    this.containerAlignment,
    this.suffixText,
    this.suffixTextStyle,
    this.suffixIconConstraints,
    this.readOnly = false,
    this.cursorColor,
    this.maxLength,
    this.errorMaxLines = 2,
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.autofocus = false,
    this.inputFormatters,
    this.errorText,
    this.errorStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters ?? <TextInputFormatter>[],
      // Only numbers can be entered
      autofocus: autofocus,
      textInputAction: textInputAction,
      maxLength: maxLength,
      readOnly: readOnly,
      cursorColor: cursorColor,
      enabled: enabled,
      textAlignVertical: TextAlignVertical.center,
      textAlign: textAlign,
      textDirection: textDirection,
      initialValue: initialValue,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      onTap: onTap,
      obscureText: obscureText,
      style: getRegularInterStyle(
          color: ColorManager.warmGrey2, fontSize: AppSize.s16.sp),
      autofillHints: autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        errorStyle: errorStyle,
        counterText: '',
        errorText: errorText,
        suffixStyle: suffixTextStyle,
        suffixText: suffixText,
        errorMaxLines: errorMaxLines,
        labelText: null,
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: InputBorder.none,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
            vertical: AppSize.s1_5.h, horizontal: AppSize.s3.w),
      ),
    );
  }
}
