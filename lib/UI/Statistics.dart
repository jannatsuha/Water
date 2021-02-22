import 'package:flutter/material.dart';
import 'package:water/Colors/AppColor.dart';
class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    double _widthOnly= MediaQuery.of(context).size.width;
    double _heightOnly= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appPrimaryColor,
        toolbarHeight: _heightOnly*0.09,
        centerTitle: true,
        title:
        Text("Statistics",textAlign: TextAlign.center,),
      ),
      body: Container(

      ),
    );
  }
}
