import 'package:flutter/material.dart';
import 'package:hr/presentation/resources/color_manager.dart';
import 'package:hr/presentation/resources/routes_manager.dart';
import 'package:hr/presentation/resources/values_manager.dart';
import 'package:hr/presentation/widget/customButton.dart';
import 'package:hr/presentation/widget/custom_auth_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RequestsDetails extends StatelessWidget {
  const RequestsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: ColorManager.baseColor,
                            size: 25,
                          )),

                    ],
                  ),
                  SizedBox(
                    height: AppSize.s2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ahmed Request',
                        style: TextStyle(
                            color: ColorManager.baseColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.add,
                            color: ColorManager.baseColor,
                            size: 20,
                          ),
                          Text(
                            'Add New',
                            style: TextStyle(
                              color: ColorManager.baseColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: AppSize.s2.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customText(title: 'Request Type'),
                          customText(title: 'Date'),
                          customText(title: 'Level'),
                          customText(title: 'Group'),
                          customText(title: 'Status'),
                        ],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            customTextDes(title: 'Request Type'),
                            customTextDes(title: '20-2-2022'),
                            customTextDes(title: 'Leader'),
                            customTextDes(title: 'omrax'),
                            customTextDes(title: 'blank'),
                          ] )

                    ],
                      ),
                  SizedBox(
                    height: AppSize.s25.h,
                  ),
                  CustomButton(
title: 'SucssufflySceen',
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.successfullyRoute);
                    },
                  ),
                    ],
                  )



              ),
            ),
          ),
        );
  }
  Widget customText({required String title}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
            color: ColorManager.baseColor,
            fontSize: 20,
            fontWeight: FontWeight.w500),
      ),
    );
  }
  Widget customTextDes({required String title}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
            color: ColorManager.greyDark3,
            fontSize: 20,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
