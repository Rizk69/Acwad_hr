import 'package:flutter/material.dart';
import 'package:hr/presentation/resources/routes_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../../widget/custom_text_field.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Projects',
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 18),
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
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.pushNamed(context, Routes.projectDetailsRoute);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 18),
                      decoration: BoxDecoration(
                          color: ColorManager.grey2.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.asset('assets/images/Sports equipment.png',
                          height: 35),
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
            ),
          ],
        ),
      ),
    ));
  }
}
