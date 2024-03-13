import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

class SalariesView extends StatelessWidget {
  const SalariesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0XFFf4e4ef),
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 200.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Salaries',
                        style: TextStyle(
                          color: ColorManager.baseColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: ColorManager.baseColor,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s2.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 28),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: ColorManager.baseColor, width: 2),
                        borderRadius: BorderRadius.circular(80)),
                    child: Column(
                      children: [
                        Text(
                          '10000',
                          style: TextStyle(
                            color: ColorManager.baseColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'USD',
                          style: TextStyle(
                            color: ColorManager.baseColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Hours',
                            style: TextStyle(
                              color: ColorManager.baseColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            width: AppSize.s19.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: ColorManager.baseColor,
                            )),
                          ),
                          Text(
                            '1763',
                            style: TextStyle(
                              color: ColorManager.baseColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Currency',
                            style: TextStyle(
                              color: ColorManager.baseColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            width: AppSize.s19.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: ColorManager.baseColor,
                            )),
                          ),
                          Text(
                            'USD',
                            style: TextStyle(
                              color: ColorManager.baseColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'Teams',
                        style: TextStyle(
                          color: ColorManager.baseColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: AppSize.s19.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: ColorManager.baseColor,
                        )),
                      ),
                      Text(
                        '4',
                        style: TextStyle(
                          color: ColorManager.baseColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s2.h,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppSize.s3.h,
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 19),
                  padding: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      color: Color(0Xfff0f4fa),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.grey2.withOpacity(0.4),
                            spreadRadius: 9,
                            blurRadius: 8)
                      ]),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Sports equipment.png',
                          height: 100, width: 60, fit: BoxFit.fitHeight),
                      const SizedBox(
                        width: AppSize.s15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Omran group',
                            style: TextStyle(
                                color: ColorManager.baseColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '298479',
                            style: TextStyle(
                                color: ColorManager.grey5,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ColorManager.baseColor,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2 - 50, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height + 50, size.width / 2 + 50, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
