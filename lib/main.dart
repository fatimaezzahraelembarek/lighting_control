import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/lighting_control/presentation/controllers/lighting_controller.dart';
import 'features/lighting_control/presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LightingController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
