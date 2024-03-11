import 'package:flutter/material.dart';
import 'package:hr/presentation/resources/assets_manager.dart';

getAuthScreenDecoration(){
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage(ImageAssets.startScreen),
        alignment: Alignment.topCenter,
        fit: BoxFit.fitWidth),
  );
}
