import 'package:firebase_auth/firebase_auth.dart';
import 'package:water/UI/Login.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:water/Colors/AppColor.dart';
import 'package:water/UI/HomePage.dart';
import 'package:water/UI/WelcomePage.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:water/main.dart';
class SetProfile extends StatefulWidget {
  @override
  _SetProfileState createState() => _SetProfileState();
}
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String _email, _password,_birthday,_address,_occupation,_gender,_contact,_name;
File _image;
File _imageProfile;
final picker = ImagePicker();
final pickerProfile = ImagePicker();
bool pressGeoON = true;
Color colorBlue=AppColor.appTextColor2;
Color colorGrey;
class _SetProfileState extends State<SetProfile> {


  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  TextEditingController dateCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    double _widthOnly= MediaQuery.of(context).size.width;
    double _heightOnly= MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child:
          Column(
            children: [
              SizedBox(height: _heightOnly*0.1,),
              Align(
                alignment: Alignment.center,
                child: Text("Set Profile",style: TextStyle(
                    color: AppColor.appDetailsFontColor,fontWeight:FontWeight.bold,
                    fontSize: _widthOnly*0.09
                ),),
              ),
              SizedBox(height: _heightOnly*0.05,),
              Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.06, 0, MediaQuery.of(context).size.width*0.06, 0)
                ,child:
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex:1,
                              child: Text("Name",style: TextStyle(fontSize: _widthOnly*0.05),)),
                         // SizedBox(width: 10,),
                          Expanded(
                             flex:2,
                            child: TextFormField(
                              textDirection: TextDirection.rtl,
                              cursorColor: AppColor.appTextColor2,
                              style: TextStyle(color: AppColor.appTextColor2,fontSize:_widthOnly*0.05, ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Name is empty';
                                }
                                return null;
                              },
                              onSaved: (input) => _name = input,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hoverColor: AppColor.appTextColor2,
                                focusColor: AppColor.appTextColor2,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Enter Name",hintTextDirection: TextDirection.rtl,
                                 hintStyle: TextStyle(fontSize: _widthOnly*0.05,color: AppColor.appIconColor),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.001,
                      child: Container(
                        color: AppColor.appIconColor,
                      ),),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex:1,
                              child: Text("Birthday",style: TextStyle(fontSize: _widthOnly*0.05),)),
                          // SizedBox(width: 10,),
                          Expanded(
                            flex:2,
                            child:
                            TextFormField(
                              textDirection: TextDirection.rtl,
                              cursorColor: AppColor.appTextColor2,
                              style: TextStyle(color: AppColor.appTextColor2,fontSize:_widthOnly*0.05 ),
              validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return null;
              },
                              onSaved: (input) => _birthday = input,
              controller: dateCtl,
              decoration: InputDecoration(
                    // prefix:Text("Check-In"),
                  hoverColor: AppColor.appTextColor2,
                                focusColor: AppColor.appTextColor2,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                    hintText: "yyyy-mm-dd",hintTextDirection: TextDirection.rtl,hintStyle: TextStyle(fontSize: _heightOnly*0.025,color: AppColor.appIconColor,
                   ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: _widthOnly*0.03,
                      vertical: _heightOnly*0.01,
                    ),


              ),
              onTap: ()
              async{
                  DateTime date = DateTime(2020);
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(
                      context: context,
                      initialDate:DateTime.now(),
                      firstDate:DateTime.now().subtract(Duration(days: 0)),
                      lastDate: DateTime(2040));
                  dateCtl.text = date.toString().substring(0,10);
              },
            ),
                          ),

                        ],
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.001,
                        child: Container(
                          color: AppColor.appIconColor,
                        ),),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex:1,
                              child: Text("Password",style: TextStyle(fontSize: _widthOnly*0.05),)),
                          // SizedBox(width: 10,),
                          Expanded(
                            flex:2,
                            child: TextFormField(
                              controller: passwordController,
                              textDirection: TextDirection.rtl,
                              cursorColor: AppColor.appTextColor2,
                              style: TextStyle(color: AppColor.appTextColor2,fontSize:_widthOnly*0.05 ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Text is empty';
                                }else if(text.length<6)
                                  return 'Password should be atleast 6 character';
                                return null;
                              },
                              onSaved: (input)=> password=input,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                hoverColor: AppColor.appTextColor2,
                                focusColor: AppColor.appTextColor2,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Enter Your Password",hintTextDirection: TextDirection.rtl,
                                hintStyle: TextStyle(fontSize: _widthOnly*0.05,color: AppColor.appIconColor),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.001,
                      child: Container(
                        color: AppColor.appIconColor,
                      ),),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex:1,
                              child: Text("Address",style: TextStyle(fontSize: _widthOnly*0.05),)),
                          // SizedBox(width: 10,),
                          Expanded(
                            flex:2,
                            child: TextFormField(
                              textDirection: TextDirection.rtl,
                              cursorColor: AppColor.appTextColor2,
                              style: TextStyle(color: AppColor.appTextColor2,fontSize:_widthOnly*0.05 ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Text is empty';
                                }
                                return null;
                              },
                              onSaved: (input) => _address = input,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hoverColor: AppColor.appTextColor2,
                                focusColor: AppColor.appTextColor2,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Enter Address",hintTextDirection: TextDirection.rtl,
                                hintStyle: TextStyle(fontSize: _widthOnly*0.05,color: AppColor.appIconColor),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.001,
                      child: Container(
                        color: AppColor.appIconColor,
                      ),),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex:1,
                              child: Text("Email",style: TextStyle(fontSize: _widthOnly*0.05),)),
                          // SizedBox(width: 10,),
                          Expanded(
                            flex:2,
                            child: TextFormField(
                              textDirection: TextDirection.rtl,
                              cursorColor: AppColor.appTextColor2,
                              style: TextStyle(color: AppColor.appTextColor2,fontSize:_widthOnly*0.05 ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Text is empty';
                                }
                                return null;
                              },
                              onSaved: (input) => _email = input,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hoverColor: AppColor.appTextColor2,
                                focusColor: AppColor.appTextColor2,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Enter Email",hintTextDirection: TextDirection.rtl,
                                hintStyle: TextStyle(fontSize: _widthOnly*0.05,color: AppColor.appIconColor),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.001,
                      child: Container(
                        color: AppColor.appIconColor,
                      ),),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex:1,
                              child: Text("Occupation",style: TextStyle(fontSize: _widthOnly*0.05),)),
                          // SizedBox(width: 10,),
                          Expanded(
                            flex:2,
                            child: TextFormField(
                              textDirection: TextDirection.rtl,
                              cursorColor: AppColor.appTextColor2,
                              style: TextStyle(color: AppColor.appTextColor2,fontSize:_widthOnly*0.05 ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Text is empty';
                                }
                                return null;
                              },
                              onSaved: (input) => _occupation = input,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hoverColor: AppColor.appTextColor2,
                                focusColor: AppColor.appTextColor2,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Enter Occupation",hintTextDirection: TextDirection.rtl,
                                hintStyle: TextStyle(fontSize: _widthOnly*0.05,color: AppColor.appIconColor),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.001,
                      child: Container(
                        color: AppColor.appIconColor,
                      ),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex:1,
                              child: Text("Gender",style: TextStyle(fontSize: _widthOnly*0.05),)),
                          // SizedBox(width: 10,),
                          Expanded(

                            child:
                              ToggleSwitch(
                        minHeight: _heightOnly*0.05,
                        cornerRadius: 10.0,
                        activeBgColor: colorBlue,
                        activeFgColor: Colors.white,
                        inactiveBgColor: colorGrey,
                        inactiveFgColor: Colors.white,
                        labels: ['Male', 'Female'],
                        onToggle: (index) {
                          if(index==0)
                          {
                            setState(() {
                              colorBlue=AppColor.appTextColor2;
                              colorGrey=AppColor.appIconColor;
                              pressGeoON =true;
                              _gender="Male";
                            });
                          }else if(index==1){

                            setState(() {
                              colorBlue=AppColor.appIconColor;
                              colorGrey=AppColor.appTextColor2;
                              pressGeoON = false;
                              _gender="Female";
                            });
                          }
                        },
                      ),
                          ),

                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.001,
                      child: Container(
                        color: AppColor.appIconColor,
                      ),),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex:1,
                              child: Text("Contact No",style: TextStyle(fontSize: _widthOnly*0.05),)),
                          // SizedBox(width: 10,),
                          Expanded(
                            flex:2,
                            child: TextFormField(
                              textDirection: TextDirection.rtl,
                              cursorColor: AppColor.appTextColor2,
                              style: TextStyle(color: AppColor.appTextColor2,fontSize:_widthOnly*0.05 ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Text is empty';
                                }
                                return null;
                              },
                              onSaved: (input) => _contact = input,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hoverColor: AppColor.appTextColor2,
                                focusColor: AppColor.appTextColor2,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Enter contact number",hintTextDirection: TextDirection.rtl,
                                hintStyle: TextStyle(fontSize: _widthOnly*0.05,color: AppColor.appIconColor),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      // SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      // SizedBox(height: MediaQuery.of(context).size.height*0.001,
                      // child: Container(
                      //   color: AppColor.appIconColor,
                      // ),),
                      // Row(
                      //   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Expanded(
                      //       flex:1,
                      //         child: Text("Add picture",style: TextStyle(fontSize: _widthOnly*0.05),)),
                      //    // SizedBox(width: 10,),
                      //     if(_image==null)
                      //       Expanded(
                      //         child: InkWell(
                      //           onTap: getImage,
                      //           child:
                      //           Container(
                      //               width: _heightOnly*0.05,
                      //               height: _heightOnly*0.05,
                      //               decoration: new BoxDecoration(
                      //                   shape: BoxShape.circle,
                      //                   image: new DecorationImage(
                      //                     fit: BoxFit.cover,
                      //                     image:
                      //                     AssetImage('assets/image/bird.png',),
                      //                   )
                      //               )
                      //           ),
                      //         ),
                      //       )
                      //     else
                      //       Expanded(
                      //         child: InkWell(
                      //           onTap: getImage,
                      //           child:
                      //           Container(
                      //               width: _heightOnly*0.06,
                      //               height: _heightOnly*0.06,
                      //               decoration: new BoxDecoration(
                      //                   shape: BoxShape.circle,
                      //                   image: new DecorationImage(
                      //                     fit: BoxFit.contain,
                      //                     image: FileImage(_image),
                      //                   )
                      //               )
                      //           ),
                      //         ),
                      //       )
                      //   ],
                      // ),
                      SizedBox(height: _heightOnly*0.03,),
                      Container(
                        alignment: Alignment.center,
                        child:
                        SizedBox(
                            height: MediaQuery.of(context).size.height*0.07,
                            child:
                            FlatButton(
                              shape: RoundedRectangleBorder(borderRadius:
                              BorderRadius.circular(20.0)),
                              onPressed: () =>
                                 signUp(),
                              color: AppColor.appPrimaryColor,
                              child:
                              Align(
                                  alignment: Alignment.center,
                                  child:
                                  Text("Let's Go!",style: TextStyle(color: Colors.white,fontSize: 20),)
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                    ],
                  ),
                ) ,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
      }catch(e){
        print(e.message);
      }
    }
  }
}
