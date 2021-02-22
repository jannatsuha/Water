import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water/Colors/AppColor.dart';
import 'package:water/UI/AuthenticationWrapper.dart';
import 'package:water/UI/HomePage.dart';
import 'package:water/UI/Login.dart';
import 'package:water/UI/AuthenticationService.dart';
//import 'UI/AuthenticationService.dart';
import 'package:water/UI/SetProfile.dart';
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    double _widthOnly= MediaQuery.of(context).size.width;
    double _heightOnly= MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: AppColor.appButtonColorWhite,
          child: Column(
            children: [
              SizedBox(height: _heightOnly*0.12,),
              Align(
                alignment: Alignment.center,
                child: Text("Welcome",style: TextStyle(
                    color: AppColor.appPrimaryColor,fontWeight:FontWeight.bold,
                    fontSize: _widthOnly*0.09
                ),),
              ),
              SizedBox(height: _heightOnly*0.05,),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Group A08 Presents",textAlign:TextAlign.center,
                    style: TextStyle(
                        color: AppColor.appDetailsFontColor,
                        fontWeight:FontWeight.bold,fontSize: _widthOnly*0.06
                    ),),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("A New Solution to Save Water",textAlign:TextAlign.center,
                    style: TextStyle(
                      color: AppColor.appDetailsFontColor,
                        fontWeight:FontWeight.bold,fontSize: _widthOnly*0.05
                  ),),
                ),
              ),
              SizedBox(height: _heightOnly*0.05,),
              Container(
                child: Image.asset('assets/image/idea2.png',
                  height: _widthOnly*0.55,width: _widthOnly*0.5,),
              ),
              SizedBox(height: _heightOnly*0.04,),
              Align(
                alignment: Alignment.center,
                child: Text("You're just one finger touch away to",
                  style: TextStyle(
                      color: AppColor.appDetailsFontColor,
                      fontSize: _widthOnly*0.05
                  ),),
              ),
              Align(
                alignment: Alignment.center,
                child: Text("Save Water!",
                  style: TextStyle(
                      color: AppColor.appDetailsFontColor,
                      fontWeight:FontWeight.bold,fontSize: _widthOnly*0.05
                  ),),
              ),
              SizedBox(height: _heightOnly*0.03,),
              Container(
                  padding: EdgeInsets.fromLTRB(_widthOnly*0.09, 10, _widthOnly*0.09, 10) ,
                  height: _heightOnly*0.09,
                  width: _widthOnly*0.7,
                  decoration: BoxDecoration(
                    color: AppColor.appPrimaryColor,
                    border: Border.all(
                      color: AppColor.appButtonColorWhite,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child:
                  FlatButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Start",style:
                      TextStyle(color: AppColor.appFontColorWhite,fontSize: _widthOnly*0.02+_heightOnly*0.02 ),),),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuthenticationWrapper()),
                      );
                    }
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
