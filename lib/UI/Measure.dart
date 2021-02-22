import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/Colors/AppColor.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:water/UI/WelcomePage.dart';
class Measure extends StatefulWidget {
  @override
  _MeasureState createState() => _MeasureState();
}
Color colorBlue=AppColor.appTextColor2;
Color colorGrey;
bool pressGeoON = true;
bool MeasureButtonPressed = false;
String controlText="ON";
AnimationController animationController;
bool isPlay=false;
String gifPic="assets/image/wavePng.png";
String measureButtonText="Measure";
String waterLevel="0";
Timer _timer;
int _start = 0;
class _MeasureState extends State<Measure> {


  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 100 || MeasureButtonPressed ) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start++;
          });
        }
      },
    );
  }
  @override
  void dispose() {
    _timer=0 as Timer;
    super.dispose();
  }
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
        Text("Measure & Control",textAlign: TextAlign.center,),
      ),
      body: Stack(
        children: [
          Positioned(
            top: _heightOnly*0.01,
            left: _widthOnly*0.1,
            child:
             ToggleSwitch(
            minHeight: _heightOnly*0.065,
            minWidth: _widthOnly*0.4,
            cornerRadius: 10.0,
            activeBgColor: colorBlue,
            activeFgColor: Colors.white,
            inactiveBgColor: colorGrey,
            inactiveFgColor: Colors.white,
            labels: ['Measure', 'Control'],
            onToggle: (index) {
              if(index==0)
              {
                setState(() {
                  colorBlue=AppColor.appTextColor2;
                  colorGrey=AppColor.appIconColor;
                  pressGeoON =true;
                });
              }else if(index==1){

                setState(() {
                  colorBlue=AppColor.appIconColor;
                  colorGrey=AppColor.appTextColor2;
                  pressGeoON = false;
                });
              }
            },
          ),
          ),
          if(pressGeoON)
          Positioned(
            top: _heightOnly*0.1,
            left: _widthOnly*0.1,
            child: Container(
              child:
              Column(
                children: [
                  Container(
                    width: _heightOnly*0.38,
                    height: _heightOnly*0.38,
                    child: Text("\n\n"+_start.toString()+"%",textAlign: TextAlign.center,style: TextStyle(color: AppColor.appIconColor,fontSize: _widthOnly*0.12),),
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.appPrimaryColor,width: 10),
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          //centerSlice: Rect.fromLTRB(1.0, 0.0, 1.0, 1.0),
                          image:
                          AssetImage(
                            gifPic,
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: _heightOnly*0.13,),
                  Container(
                    alignment: Alignment.center,
                    child:
                    SizedBox(
                        height: MediaQuery.of(context).size.height*0.07,
                        width: _widthOnly*0.53,
                        child:
                        FlatButton(
                          shape: RoundedRectangleBorder(borderRadius:
                          BorderRadius.circular(25.0)),
                          onPressed: () => {
                          setState(() {
                          if(gifPic=="assets/image/wave2.gif")
                            {
                              gifPic="assets/image/wavePng.png";
                              MeasureButtonPressed=true;
                              measureButtonText="Measure";
                            }
                          else
                            {
                              gifPic="assets/image/wave2.gif";
                              measureButtonText="Stop";
                              startTimer();
                            }
                          })
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => WelcomePage()),
                            // ),
                          },
                          color: AppColor.appPrimaryColor,
                          child:
                          Align(
                              alignment: Alignment.center,
                              child:
                              Text(measureButtonText,style: TextStyle(color: Colors.white,fontSize: 20),)
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          )
          else
            Positioned(
              top: _heightOnly*0.1,
              left: 5,
              right: 5,
              child: Align(
                alignment:Alignment.center,
                child: Column(
            children: [
              SizedBox(height: _heightOnly*0.045,),
                Align(
                  alignment:Alignment.center,
                    child: Text("Manual Control",textAlign: TextAlign.center,style:
                    TextStyle(color: AppColor.appPrimaryColor,fontSize: _widthOnly*0.08,fontWeight: FontWeight.bold),
                    )
                ),
              Align(
                  alignment:Alignment.center,
                  child: Text("Current Water Percentage "+"75"+"%",textAlign: TextAlign.center,style:
                  TextStyle(color: AppColor.appPrimaryColor,fontSize: _widthOnly*0.045),
                  )
              ),
              SizedBox(height: _heightOnly*0.045,),
              InkWell(
                onTap: (){
                  setState(() {
                    if(controlText=="ON")
                    controlText="OFF";
                    else
                      controlText="ON";
                  });
                },
                child: Container(
                  width: _heightOnly*0.3,
                  height: _heightOnly*0.3,
                  child: Align(
                      alignment:Alignment.center,
                      child: Text(controlText,textAlign: TextAlign.center,style: TextStyle(
                          color: AppColor.appButtonColorWhite,fontSize: _widthOnly*0.12,fontWeight: FontWeight.bold),)),
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.appTextColor2,
                      border: Border.all(color: AppColor.appPrimaryColor,width: 2),

                  ),
                ),
              ),
              SizedBox(height: _heightOnly*0.13,),
              Container(
                alignment: Alignment.center,
                child:
                SizedBox(
                    height: MediaQuery.of(context).size.height*0.07,
                    width: _widthOnly*0.73,
                    child:
                    FlatButton(
                      shape: RoundedRectangleBorder(borderRadius:
                      BorderRadius.circular(25.0)),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WelcomePage()),
                        ),
                      },
                      color: AppColor.appPrimaryColor,
                      child:
                      Align(
                          alignment: Alignment.center,
                          child:
                          Text("Connect Bluetooth",style: TextStyle(color: Colors.white,fontSize: 20),)
                      ),
                    )
                ),
              ),
            ],
          ),
              ),
          )
        ],
      ),
    );
  }
}
