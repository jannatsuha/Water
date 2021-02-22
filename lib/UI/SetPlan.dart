import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/Colors/AppColor.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:water/UI/WelcomePage.dart';
class SetPlan extends StatefulWidget {
  @override
  _SetPlanState createState() => _SetPlanState();
}
double _widthOnly;
double _heightOnly;
bool _switchValue=true;
Column container(String name, int num1, int num2,int num3, String extension)
{
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 12,),
      Padding(
        padding:  EdgeInsets.fromLTRB(_widthOnly*0.08,5,5,5),
        child: Text(name,textDirection: TextDirection.ltr,style:
        TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0,8,0,8),
        child:  LinearPercentIndicator(
          alignment: MainAxisAlignment.center,
          width: _widthOnly*0.8,
          animation: true,
          lineHeight: 6.0,
          animationDuration: 2000,
          percent: num2.toDouble()/num3.toDouble(),
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: AppColor.appTextColor2,
          backgroundColor: Colors.black26,
        ),
      ),
      Padding(
        padding:  EdgeInsets.fromLTRB(_widthOnly*0.08,5,_widthOnly*0.08,5),
        child: Row(
          children: [
            Text(num1.toString(),textDirection: TextDirection.ltr,style:
            TextStyle(fontSize: 10,color:AppColor.appIconColor,fontWeight: FontWeight.bold)),
            Spacer(),
            Text(num2.toString()+"/"+num3.toString()+extension,textDirection: TextDirection.ltr,style:
            TextStyle(fontSize: 10,color:AppColor.appIconColor,fontWeight: FontWeight.bold)),
          ],
        ),

      ),
      Padding(
        padding:  EdgeInsets.fromLTRB(_widthOnly*0.08,5,_widthOnly*0.08,5),
        child: Container(
          color: AppColor.appIconColor,
          height: 1,
        ),
      )

    ],
  );
}

class _SetPlanState extends State<SetPlan> {
  @override
  Widget build(BuildContext context) {
     _widthOnly= MediaQuery.of(context).size.width;
     _heightOnly= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appPrimaryColor,
        toolbarHeight: _heightOnly*0.09,
        centerTitle: true,
        title:
        Text("Set Plan",textAlign: TextAlign.center,),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15,5,15,5),
          child:
          Column(
            children: [
              container("Daily Need", 100, 3000, 5000,"ml"),
              container("Set Limit", 1, 200, 1000,"ml"),
              container("Time Interval", 1, 1, 24,"h"),
              SizedBox(height: 2,),
              Padding(
                padding:  EdgeInsets.fromLTRB(_widthOnly*0.08,5,_widthOnly*0.08,5),
                child: Row(
                  children: [
                    Text("Water Remainder",textDirection: TextDirection.ltr,style:
                    TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    Spacer(),
                    CupertinoSwitch(
                      activeColor: AppColor.appTextColor2,
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.fromLTRB(_widthOnly*0.08,5,_widthOnly*0.08,5),
                child: Container(
                  color: AppColor.appIconColor,
                  height: 1,
                ),
              ),
              SizedBox(height: 2,),
              Padding(
                padding:  EdgeInsets.fromLTRB(_widthOnly*0.08,5,_widthOnly*0.08,5),
                child: Row(
                  children: [
                    Text("Start",textDirection: TextDirection.ltr,style:
                    TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("9 AM",textDirection: TextDirection.ltr,style:
                    TextStyle(fontSize: 10,color:AppColor.appIconColor,fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.09,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(

                      height: _heightOnly*0.06,
                      width: _widthOnly*0.3,
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
                          child: Text("Edit",style:
                          TextStyle(color: AppColor.appFontColorWhite,fontSize: _widthOnly*0.045 ),),),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WelcomePage()),
                          );
                        },
                      )
                  ),
                  SizedBox(width: _widthOnly*0.09,),
                  Container(
                      height: _heightOnly*0.06,
                      width: _widthOnly*0.3,
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
                          child: Text("Save",style:
                          TextStyle(color: AppColor.appFontColorWhite,fontSize: _widthOnly*0.045 ),),),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WelcomePage()),
                          );
                        },
                      )
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
