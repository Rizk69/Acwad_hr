import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../../widget/custom_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          size: 25,
                          Icons.notifications_rounded,
                          color: ColorManager.baseColor,
                        )),
                    Text(
                      'Home',
                      style: TextStyle(
                          color: ColorManager.baseColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.chat,
                          color: ColorManager.baseColor,
                          size: 25,
                        )),
                  ],
                ),
                SizedBox(
                  height: AppSize.s2.h,
                ),
                CustomAuthFormFiled(
                  prefixIcon: const Icon(Icons.search),
                  keyboardType: TextInputType.name,
                  controller: TextEditingController(),
                  cursorColor: ColorManager.baseColor,
                  autofillHints: const [AutofillHints.name],
                  textInputAction: TextInputAction.next,
                  hintText: "Search Here",
                ),
                SizedBox(
                  height: AppSize.s2.h,
                ),
                Text(
                  'Groups',
                  style: TextStyle(
                      color: ColorManager.baseColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: AppSize.s2.h,
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: ColorManager.baseColor, width: 3),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 25,
                          color: ColorManager.baseColor,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: ColorManager.baseColor, width: 3),
                            ),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset(
                                'assets/images/14c5de9837cee409060e4b740a7ecd82.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          itemCount: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSize.s2.h,
                ),
                Text(
                  'Projects',
                  style: TextStyle(
                      color: ColorManager.baseColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: AppSize.s2.h,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.grey2.withOpacity(0.4),
                            spreadRadius: 9,
                            blurRadius: 8)
                      ]),
                  child: Row(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                        decoration: BoxDecoration(
                            color: ColorManager.grey2.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Icon(Icons.add, size: 35),
                      ),
                      const SizedBox(
                        width: AppSize.s15,
                      ),
                      Text(
                        'Create New Project ',
                        style: TextStyle(
                            color: ColorManager.baseColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: ColorManager.grey2.withOpacity(0.4),
                            spreadRadius: 9,
                            blurRadius: 8)
                      ]),
                  child: Row(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                        decoration: BoxDecoration(
                            color: ColorManager.grey2.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(15)),
                        child:Image.asset('assets/images/Sports equipment.png',height: 35),
                      ),
                      const SizedBox(
                        width: AppSize.s15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sports project ',
                            style: TextStyle(
                                color: ColorManager.baseColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Omrax',
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
                SizedBox(
                  height: AppSize.s2.h,
                ),
                Text(
                  'Current Tasks',
                  style: TextStyle(
                      color: ColorManager.baseColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: AppSize.s2.h,
                ),
                Slider(
                  value: 40,
                  max: 100,
                  divisions: 5,
                  activeColor: ColorManager.baseColor,
                  onChanged: (d) {},
                ),
                SizedBox(
                  height: AppSize.s1.h,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/carbon_development.png',
                        height: 35),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Task 1',
                      style: TextStyle(
                          color: ColorManager.baseColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.s2.h,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/carbon_development.png',
                        height: 35),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Task 2',
                      style: TextStyle(
                          color: ColorManager.baseColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.s2.h,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/carbon_development.png',
                        height: 35),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Task 3',
                      style: TextStyle(
                          color: ColorManager.baseColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
