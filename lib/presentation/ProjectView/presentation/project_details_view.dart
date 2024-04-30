import 'package:flutter/material.dart';
import 'package:hr/presentation/resources/color_manager.dart';
import 'package:hr/presentation/resources/routes_manager.dart';
import 'package:hr/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({Key? key}) : super(key: key);

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
              Text(
                'Sports project',
                style: TextStyle(
                    color: ColorManager.baseColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: AppSize.s2.h,
              ),
              Text(
                'Members',
                style: TextStyle(
                    color: ColorManager.baseColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 130, // Set the height of the container
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    profileTile('+', 'Add new', '', Colors.transparent,
                        ColorManager.baseColor, ColorManager.baseColor),
                    profileTile('A', 'Ahmed', 'Leader', Colors.orange,
                        Colors.white, Colors.transparent),
                    profileTile('A', 'Ahmed', 'Officer', Colors.green,
                        Colors.white, Colors.transparent),
                    profileTile('A', 'Ahmed', 'Officer', Colors.brown,
                        Colors.white, Colors.transparent),
                    profileTile('A', 'Ahmed', 'Leader', Colors.purple,
                        Colors.white, Colors.transparent),
                    profileTile('A', 'Ahmed', 'Officer', Colors.yellow[700]!,
                        Colors.white, Colors.transparent),
                  ],
                ),
              ),
              SizedBox(
                height: AppSize.s2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tasks ',
                    style: TextStyle(
                        color: ColorManager.baseColor,
                        fontSize: 18,
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
                height: AppSize.s4.h,
              ),
              InkWell(

                  onTap:() {
                    Navigator.pushNamed(
                        context, Routes.tasksDetailsRoute);
                  },

                  child: tasksView(Colors.green, 'Task 1', 'A', Colors.black87)),
              SizedBox(
                height: AppSize.s3.h,
              ),
              tasksView(Colors.green, 'Task 1', 'A', Colors.black87),
              SizedBox(
                height: AppSize.s3.h,
              ),
              tasksView(Colors.green, 'Task 1', 'A', Colors.black87),
              SizedBox(
                height: AppSize.s4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Time sheet',
                    style: TextStyle(
                        color: ColorManager.baseColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.edit,
                        color: ColorManager.baseColor,
                        size: 20,
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                          color: ColorManager.baseColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'January',
                style: TextStyle(
                    color: ColorManager.baseColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              taskSection('1', 'Saturday', [
                TaskItem(icon: Icons.cake, taskName: 'task 1'),
                TaskItem(icon: Icons.bookmark_border, taskName: 'task 2'),
              ]),
            ],
          ),
        ),
      ),
    ));
  }

  Widget profileTile(String initial, String name, String role, Color color,
      Color colorIcon, Color colorBoder) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: colorBoder, width: 1),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: color,
              child: Text(initial,
                  style: TextStyle(fontSize: 24, color: colorIcon)),
            ),
          ),
          SizedBox(height: 6),
          Text(name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(role, style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget tasksView(
    Color initialColor,
    String name,
    String role,
    Color color,
  ) {
    return Row(
      children: <Widget>[
        Icon(Icons.circle, color: initialColor),
        SizedBox(width: 10),
        Text(name,
            style: TextStyle(
                color: ColorManager.baseColor,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
        Spacer(),
        CircleAvatar(
          radius: 15,
          backgroundColor: color,
          child: Text(role, style: TextStyle(color: Colors.white)),
        ),
        Icon(Icons.navigate_next, color: Colors.purple, size: 35),
      ],
    );
  }

  Widget taskSection(String dayNumber, String dayName, List<TaskItem> tasks) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Text('$dayNumber',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(dayName,
                  style: TextStyle(fontSize: 18, color: Colors.red[300])),
            ],
          ),
          SizedBox(
            width: AppSize.s2.h,
          ),
          Column(
            children: [
              ...tasks.map((task) => Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Icon(task.icon, color: Colors.red), // Task icon
                        SizedBox(width: 10),
                        Text(task.taskName,
                            style: TextStyle(
                                fontSize: 16, color: ColorManager.baseColor)),
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class TaskItem {
  final IconData icon;
  final String taskName;

  TaskItem({required this.icon, required this.taskName});
}
