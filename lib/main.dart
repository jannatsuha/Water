import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water/Colors/AppColor.dart';
import 'package:water/UI/HomePage.dart';
import 'package:water/UI/AuthenticationService.dart';
import 'package:water/UI/Login.dart';
import 'package:water/UI/WelcomePage.dart';
import 'UI/AuthenticationService.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return WelcomePage();
    }
    return Login();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
            seconds: 4
        ),
            (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AuthenticationWrapper(),
              )
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    double _widthOnly= MediaQuery.of(context).size.width;
    double _heightOnly= MediaQuery.of(context).size.height;
    return Scaffold(
      body:
      Container(
        height: _heightOnly,
        width: _widthOnly,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end:
            Alignment(0.0, 0.0), // 10% of the width, so there are ten blinds.
            colors: [
              const Color(0xFF128041),
              const Color(0xffffffff)
            ], // red to yellow
            //tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: _heightOnly*0.12,),
            Container(
              child: Image.asset('assets/image/university.png',
                height: _widthOnly*0.65,width: _widthOnly*0.55,),
            ),
            SizedBox(height: _heightOnly*0.02,),
            Align(
              alignment: Alignment.center,
              child: Text("Automatic Water Pump Controller",style: TextStyle(
                color: AppColor.appFontColorWhite,fontSize: _widthOnly*0.04
              ),),
            ),
            SizedBox(height: _heightOnly*0.3,),
            SizedBox(height: _heightOnly*0.035,),
            Align(
              alignment: Alignment.center,
              child: Text("Developed by H. K. Mahedi Azad",style: TextStyle(
                  color: AppColor.appFontColorWhite,fontSize: _widthOnly*0.045
              ),),
            ),
            Align(
              alignment: Alignment.center,
              child: Text("Produced by Group A08",style: TextStyle(
                  color: AppColor.appFontColorWhite,fontSize: _widthOnly*0.045
              ),),
            ),
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
