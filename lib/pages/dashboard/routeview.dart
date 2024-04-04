import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:matatu/base/BaseData.dart';
class RoutesView extends StatefulWidget {
  const RoutesView({super.key});

  @override
  State<RoutesView> createState() => _RoutesViewState();
}

class _RoutesViewState extends State<RoutesView> {
  BaseData baseData = BaseData();
  getRoutes()async{
    var response = jsonDecode(await baseData.getData('routes'));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
