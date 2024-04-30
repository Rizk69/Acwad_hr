import 'package:flutter/material.dart';
import 'package:hr/presentation/resources/routes_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../../widget/custom_text_field.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Requests',
                      style: TextStyle(
                          color: ColorManager.baseColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
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
                  height: AppSize.s5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Project x',
                      style: TextStyle(
                          color: ColorManager.baseColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: ColorManager.baseColor,
                            )),
                        Text(
                          'Add New',
                          style: TextStyle(
                              color: ColorManager.baseColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
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
                      children: [
                        Text(
                          'Ahmed',
                          style: TextStyle(
                              color: ColorManager.baseColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'start work',
                          style: TextStyle(
                              color: ColorManager.grey2,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '22-10-2022',
                          style: TextStyle(
                              color: ColorManager.grey2,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.check,color: ColorManager.mediumGreen,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.clear,color: ColorManager.red,)),
                    IconButton(onPressed: (){
                      Navigator.pushNamed(context, Routes.successfullyRoute);

                    }, icon: Icon(Icons.arrow_forward_ios,color: ColorManager.baseColor,)),

                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
