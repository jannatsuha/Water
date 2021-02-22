import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/Colors/AppColor.dart';
import 'package:water/UI/WelcomePage.dart';
class HouseInfo extends StatefulWidget {
  @override
  _HouseInfoState createState() => _HouseInfoState();
}

class _HouseInfoState extends State<HouseInfo> {
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
        Text("House Info",textAlign: TextAlign.center,),
      ),
      body: Container(
        child: Padding(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.06, 0, MediaQuery.of(context).size.width*0.06, 0),
          child: Column(
            children: [
              SizedBox(height: _heightOnly*0.035,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex:2,
                      child: Text("Water Tank Size",style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor,fontWeight: FontWeight.bold),)),
                  // SizedBox(width: 10,),
                  Expanded(
                    flex:1,
                    child:
                    Text("20 Litre",textDirection:TextDirection.rtl,style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor),)
                  ),

                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              SizedBox(height: MediaQuery.of(context).size.height*0.001,
                child: Container(
                  color: AppColor.appIconColor,
                ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex:1,
                      child: Text("Tank Height",style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor,fontWeight: FontWeight.bold),)),
                  // SizedBox(width: 10,),
                  Expanded(
                      flex:1,
                      child:
                      Text("175 cm",textDirection:TextDirection.rtl,style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor),)
                  ),

                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              SizedBox(height: MediaQuery.of(context).size.height*0.001,
                child: Container(
                  color: AppColor.appIconColor,
                ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex:1,
                      child: Text("House Stories",style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor,fontWeight: FontWeight.bold),)),
                  // SizedBox(width: 10,),
                  Expanded(
                      flex:2,
                      child:
                      Text("8 Stories",textDirection:TextDirection.rtl,style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor),)
                  ),

                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.001,
                child: Container(
                  color: AppColor.appIconColor,
                ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex:1,
                      child: Text("Total Families",style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor,fontWeight: FontWeight.bold),)),
                  // SizedBox(width: 10,),
                  Expanded(
                      flex:1,
                      child:
                      Text("16",textDirection:TextDirection.rtl,style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor),)
                  ),

                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              SizedBox(height: MediaQuery.of(context).size.height*0.001,
                child: Container(
                  color: AppColor.appIconColor,
                ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex:1,
                      child: Text("Pump Power",style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor,fontWeight: FontWeight.bold),)),
                  // SizedBox(width: 10,),
                  Expanded(
                      flex:2,
                      child:
                      Text("Beginer",textDirection:TextDirection.rtl,style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor),)
                  ),

                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              SizedBox(height: MediaQuery.of(context).size.height*0.001,
                child: Container(
                  color: AppColor.appIconColor,
                ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex:1,
                      child: Text("Pump Voltage",style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor,fontWeight: FontWeight.bold),)),
                  // SizedBox(width: 10,),
                  Expanded(
                      flex:2,
                      child:
                      Text("Beginer",textDirection:TextDirection.rtl,style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor),)
                  ),

                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              SizedBox(height: MediaQuery.of(context).size.height*0.001,
                child: Container(
                  color: AppColor.appIconColor,
                ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex:1,
                      child: Text("Free Trial Remaining",style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor,fontWeight: FontWeight.bold),)),
                  // SizedBox(width: 10,),
                  Expanded(
                      flex:2,
                      child:
                      Text("90 Days",textDirection:TextDirection.rtl,style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor),)
                  ),

                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              SizedBox(height: MediaQuery.of(context).size.height*0.001,
                child: Container(
                  color: AppColor.appIconColor,
                ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex:1,
                      child: Text("Buy Subscription",style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor,fontWeight: FontWeight.bold),)),
                  // SizedBox(width: 10,),
                  Expanded(
                      flex:2,
                      child:
                      Text("Coming Soon!",textDirection:TextDirection.rtl,style: TextStyle(fontSize: _widthOnly*0.045,color: AppColor.appIconColor),)
                  ),

                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.001,
                child: Container(
                  color: AppColor.appIconColor,
                ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
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
                  SizedBox(width: _widthOnly*0.05,),
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
          ),
        ),
      ),
    );
  }
}
