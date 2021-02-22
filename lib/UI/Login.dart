import 'package:flutter/material.dart';
import 'package:water/Colors/AppColor.dart';
import 'package:water/UI/AuthenticationService.dart';
import 'package:water/UI/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:water/UI/SetProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
String email;
String password;
class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
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
        Text("Login",textAlign: TextAlign.center,),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child:
          Column(
            children: [
              SizedBox(height: _heightOnly*0.1,),
              Align(
                alignment: Alignment.center,
                child: Text("Log In",style: TextStyle(
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
                              child: Text("Email",style: TextStyle(fontSize: _widthOnly*0.05),)),
                          // SizedBox(width: 10,),
                          Expanded(
                            flex:2,
                            child: TextFormField(
                              controller: emailController,
                              textDirection: TextDirection.rtl,
                              cursorColor: AppColor.appTextColor2,
                              style: TextStyle(color: AppColor.appTextColor2,fontSize:_widthOnly*0.05, ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Text is empty';
                                }
                                    return null;
                              },
                              onSaved: (input)=> email=input,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hoverColor: AppColor.appTextColor2,
                                focusColor: AppColor.appTextColor2,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Enter Your Email",hintTextDirection: TextDirection.rtl,
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
                              onPressed: () {
                                context.read<AuthenticationService>().signIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              },
                              color: AppColor.appPrimaryColor,
                              child:
                              Align(
                                  alignment: Alignment.center,
                                  child:
                                  Text("Go!",style: TextStyle(color: Colors.white,fontSize: 20),)
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                    ],
                  ),
                ) ,
              ),
              SizedBox(height: _heightOnly*0.01,),
              Align(
                alignment: Alignment.center,
                child: Text("Don't have any ID?",style: TextStyle(
                    color: AppColor.appDetailsFontColor,fontWeight:FontWeight.bold,
                    fontSize: _widthOnly*0.04
                ),),
              ),

              SizedBox(height: _heightOnly*0.01,),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SetProfile()),
                    );
                  },
                  child: Text("Sign Up",style: TextStyle(
                      color: AppColor.appTextColor2,fontWeight:FontWeight.bold,
                      fontSize: _widthOnly*0.06
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
