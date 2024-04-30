import 'package:flutter/material.dart';
import 'package:hr/presentation/resources/color_manager.dart';
import 'package:hr/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GroupsDetails extends StatelessWidget {
  const GroupsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    'assets/images/14c5de9837cee409060e4b740a7ecd82.png',
                    height: 50,
                    width: 30,
                  ),
                ),
                Text(
                  'Omrax Group',
                  style: TextStyle(
                      color: ColorManager.baseColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: AppSize.s7.h,
            ),
            customView(
                title: 'About',
                des:
                    'lourim ipsimlourim ipsim lourim ipsim lourim  ipsim lourim ipsim  lourim ipsim  lourim ipsimlourimipsim lourim ipsim lourim'),
            SizedBox(
              height: AppSize.s3.h,
            ),
            customView(
                title: 'Vision',
                des:
                    'lourim ipsimlourim ipsim lourim ipsim lourim  ipsim lourim ipsim  lourim ipsim  lourim ipsimlourimipsim lourim ipsim lourim'),
            SizedBox(
              height: AppSize.s3.h,
            ),
            Text(
              'Year Plan',
              style: TextStyle(
                  color: ColorManager.baseColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                monthCell('October', Colors.purple[200]!),
                monthCell('November', Colors.purple[200]!),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                projectCell('Project x', Colors.yellow[200]!),
                projectCell('Project x', Colors.yellow[200]!),
                projectCell('Project x', Colors.yellow[200]!),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                goalCell('1 video/month'),
                goalCell('1 video/month'),
                goalCell('1 video/month'),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Widget customView({required String title, required String des}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: ColorManager.baseColor,
              fontSize: 22,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: AppSize.s1.h,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorManager.baseColor, width: 1),
          ),
          child: Text(
            des,
            style: TextStyle(
              color: Colors.black45,
            ),
          ),
        )
      ],
    );
  }

  Widget monthCell(String month, Color color) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 50,
      color: color,
      child: Text(month, style: TextStyle(color: Colors.white)),
    );
  }

  Widget projectCell(String project, Color color) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 50,
      color: color,
      child: Text(project),
    );
  }

  Widget goalCell(String goal) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 50,
      color: Colors.yellow[100],
      child: Text(goal),
    );
  }
}
