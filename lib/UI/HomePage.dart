import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/Colors/AppColor.dart';
import 'package:water/UI/HouseInfo.dart';
import 'package:water/UI/Measure.dart';
import 'package:water/UI/SetPlan.dart';
import 'package:water/UI/Settings.dart';
import 'package:water/UI/Statistics.dart';
import 'package:water/UI/Support.dart';
import 'package:water/UI/WelcomePage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
String userName="H.K Mahedi Azad";
String userOccupation="Engineer";
double _widthOnly;
double _heightOnly;
class _HomePageState extends State<HomePage> {

  Card OptionsCard(IconData icon,String itemName)
  {
    return Card(
      elevation: 8.0,
      color: AppColor.appButtonColorWhite,

      shape: RoundedRectangleBorder(borderRadius:
      BorderRadius.circular(5.0)),
      child: Container(alignment: Alignment.center,
          decoration: BoxDecoration(
          ),
          child:
          Column(
            children: [
              SizedBox(height: _heightOnly*0.02,),
              Icon(icon),
              SizedBox(height: _heightOnly*0.013,),
              Text(itemName,textAlign:
                TextAlign.center,style: TextStyle(fontSize:
                _widthOnly*0.033 ,color: AppColor.appIconColor,fontWeight: FontWeight.bold),),
            ],
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _widthOnly= MediaQuery.of(context).size.width;
    _heightOnly= MediaQuery.of(context).size.height;
    return Scaffold(
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: _heightOnly*0.06,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset("assets/image/university.png",height: _heightOnly*0.12,width: _widthOnly*0.12,),
                    SizedBox(width: _widthOnly*0.05,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text("Ahsanullah University",
                            style: TextStyle(
                                color: AppColor.appPrimaryColor,
                                fontSize: _widthOnly*0.07,fontWeight: FontWeight.bold
                            ),),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text("of Science and Technology",
                            style: TextStyle(
                                color: AppColor.appIconColor,
                                fontSize: _widthOnly*0.05,fontWeight: FontWeight.bold
                            ),),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: _heightOnly*0.025,),
                Align(
                  alignment: Alignment.center,
                  child: Text("Automatic Water Pump Controller",textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.appPrimaryColor,
                        fontSize: _widthOnly*0.055
                    ),),
                ),
                SizedBox(height: _heightOnly*0.03,),
                Row(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColor.appPrimaryColor),
                        borderRadius: BorderRadius.circular(60.0),),
                      child:
                      Container(
                          width: _widthOnly*0.14,
                          height: _widthOnly*0.14,
                          decoration: new BoxDecoration(

                              image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new AssetImage('assets/image/bird.png'),
                              )
                          )),
                    ),
                    SizedBox(width: 5,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(userName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: _widthOnly*0.05,fontWeight: FontWeight.bold
                            ),),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(userOccupation,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColor.appIconColor,
                                fontSize: _widthOnly*0.035,fontWeight: FontWeight.bold
                            ),),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: _heightOnly*0.03,),
                Container(
                  child:
                  Align(
                    alignment: Alignment.center,
                    child: Text('"পানি অপচয়ের দিন শেষ \n এবার হাসবে বাংলাদেশ"',textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.appTextColor2,
                          fontSize: _widthOnly*0.065
                      ),),
                  ),
                ),
                SizedBox(height: _heightOnly*0.03,),
                Container(
                    height: _heightOnly/3.8,
                    child: GridView.count(
                        childAspectRatio: 1.2,
                        crossAxisCount: 3,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.all(2.0),
                        children:[
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HouseInfo()),
                              );
                            },
                            child:OptionsCard(Icons.house_outlined,"House Info"),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Measure()),
                              );
                            },
                            child:OptionsCard(Icons.speed_outlined,"Measure"),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SetPlan()),
                              );
                            },
                            child:OptionsCard(Icons.assignment_outlined,"Set Plan"),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Statistics()),
                              );
                            },
                            child:OptionsCard(Icons.bar_chart_sharp,"Statistics"),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Settings()),
                              );
                            },
                            child:OptionsCard(Icons.settings,"Settings"),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Support()),
                              );
                            },
                            child:OptionsCard(Icons.lightbulb,"Support"),
                          ),
                        ]
                    )
                ),
                Container(
                  child:
                  Image.asset("assets/image/mujibborsho.png",height: _heightOnly*0.19,width: _widthOnly*0.9,),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
