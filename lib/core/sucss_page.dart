import 'package:flutter/material.dart';
import 'package:hr/core/anmation.dart';
import 'package:hr/presentation/resources/color_manager.dart';
import 'package:hr/presentation/resources/routes_manager.dart';
import 'package:hr/presentation/resources/styles_manager.dart';
import 'package:hr/presentation/resources/values_manager.dart';
import 'package:hr/presentation/widget/customButton.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class SucssufflySceen extends StatelessWidget {
  String title;
  String textbutton;
  SucssufflySceen(
      {super.key,
        required this.title,
        required this.textbutton,
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          const Center(
              child: AnimatedCheck(img: 'assets/images/sucssIcon.png')),
          SizedBox(
            height: AppSize.s4.h,
          ),
          Text(
            title,
            style: getBoldSegoeStyle(
                fontSize: 25, color:Colors.black),
          ),
          SizedBox(
            height: AppSize.s18.h,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.homeRoute);

                  },
                   title: textbutton,))
        ],
      ),
    );
  }
}

