import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr/presentation/resources/color_manager.dart';
import 'package:hr/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TasksDetails extends StatelessWidget {
  const TasksDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  Icon(Icons.circle, color: Colors.red),
                  SizedBox(
                    width: AppSize.s2.w,
                  ),
                  Text(
                    'Task 1',
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
                  title: 'Task Details',
                  des:
                      'lourim ipsimlourim ipsim lourim ipsim lourim  ipsim lourim ipsim  lourim ipsim  lourim ipsimlourimipsim lourim ipsim lourim'),
              SizedBox(
                height: AppSize.s3.h,
              ),
              SizedBox(
                height: AppSize.s3.h,
              ),
              Text(
                'Assign',
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
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorManager.baseColor, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.red,
                        child: Text('A', style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        width: AppSize.s2.w,
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.green,
                        child: Text('C', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  )),
              SizedBox(
                height: AppSize.s7.h,
              ),
              Text(
                'Status',
                style: TextStyle(
                    color: ColorManager.baseColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: AppSize.s1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(5, (index) => stepIndicator(index == 0)),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'in progress',
                  style: TextStyle(
                    color: ColorManager.greyDark3,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.s7.h,
              ),
              customView(
                  title: 'Notes',
                  des:
                      'lourim ipsimlourim ipsim lourim ipsim lourim  ipsim lourim ipsim  lourim ipsim  lourim ipsimlourimipsim lourim ipsim lourim'),
              SizedBox(
                height: AppSize.s7.h,
              ),
            ],
          ),
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

  Widget stepIndicator(bool isActive) {
    return Container(
      width: 70,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
