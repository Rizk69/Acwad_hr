
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../../widget/custom_text_field.dart';

class TeamView extends StatelessWidget {
  const TeamView({Key? key}) : super(key: key);

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
                      'Team',
                      style: TextStyle(
                          color: ColorManager.baseColor,
                          fontSize: 22,
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
                CustomAuthFormFiled(
                  prefixIcon: const Icon(Icons.search),
                  keyboardType: TextInputType.name,
                  controller: TextEditingController(),
                  cursorColor: ColorManager.baseColor,
                  autofillHints: const [AutofillHints.name],
                  textInputAction: TextInputAction.next,
                  hintText: "Search Here",
                ),

              ],
            ),
          ),
        ));
  }
}
