import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:hr/presentation/home/presentation/home_view.dart';
import 'package:hr/presentation/resources/color_manager.dart';

import '../../ProjectView/presentation/ProjectView.dart';
import '../../RequestsView/presentation/RequestsView.dart';
import '../../salaries/presentation/salaries_view.dart';
import '../../team/presentation/team_view.dart';

class HomeController extends StatefulWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  late Widget _child;

  @override
  void initState() {
    super.initState();
    _child = const HomeView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _child,
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
              iconPath: "assets/images/Slice.png",
              icon: Icons.circle,
              selectedForegroundColor: ColorManager.baseColor,
              unselectedForegroundColor: ColorManager.baseColor,
              extras: {"label": "home"}),
          FluidNavBarIcon(
              icon: Icons.groups,
              selectedForegroundColor: ColorManager.baseColor,
              unselectedForegroundColor: ColorManager.baseColor,
              extras: {"label": "bookmark"}),
          FluidNavBarIcon(
              icon: Icons.home_outlined,
              selectedForegroundColor: ColorManager.baseColor,
              unselectedForegroundColor: ColorManager.baseColor,
              extras: {"label": "partner"}),
          FluidNavBarIcon(
              icon: Icons.call_to_action_rounded,
              selectedForegroundColor: ColorManager.baseColor,
              unselectedForegroundColor: ColorManager.baseColor,
              extras: {"label": "conference"}),
          FluidNavBarIcon(
              icon: Icons.monetization_on,
              selectedForegroundColor: ColorManager.baseColor,
              unselectedForegroundColor: ColorManager.baseColor,
              extras: {"label": "rizk"}),
        ],
        onChange: _handleNavigationChange,
        style: FluidNavBarStyle(
            iconUnselectedForegroundColor: Colors.white,
            barBackgroundColor: ColorManager.grey2),
        scaleFactor: 1.2,
        defaultIndex: 2,
        itemBuilder: (icon, item) {
          print("Icon Path: ${icon.iconPath}"); // Debugging statement
          print("Extras: ${icon.extras}"); // Debugging statement
          return Semantics(
            label: icon.extras!["label"]!,
            child: item,
          );
        },
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = ProjectView();
          break;
        case 1:
          _child = TeamView();
          break;
        case 2:
          _child = const HomeView();
          break;
        case 3:
          _child = RequestsView();
          break;
        case 4:
          _child = SalariesView();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 50),
        child: _child,
      );
    });
  }
}
