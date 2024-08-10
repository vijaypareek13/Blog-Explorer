import 'package:flutter/material.dart';

import 'home_page.dart';

class DashBoardPages extends StatefulWidget {
  const DashBoardPages({super.key});

  @override
  State<DashBoardPages> createState() => _DashBoardPagesState();
}

class _DashBoardPagesState extends State<DashBoardPages> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}
