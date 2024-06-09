import 'dart:async';

import 'package:JoDija_DataSource/jodija.dart';
import 'package:JoDija_DataSource/model/user/base_model/inhertid_models/user_model.dart';
import 'package:JoDija_DataSource/utilis/shardeprefrance/shard_check.dart';
import 'package:JoDija_view/util/navigations/navigation_service.dart';
import 'package:JoDija_view/util/widgits/data_source_bloc_widgets/data_source_bloc_listner.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cleints/blocs/Auth_bloc.dart';
import 'package:cleints/consts/views/colors.dart';
import 'package:cleints/screens/home_screen.dart';
import 'package:cleints/screens/widget/signe_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isInitScreen = false;
  bool isloading = false;
  bool isRegist = false;
  AuthBloc authBloc = AuthBloc();
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(milliseconds: 100), () {


      SharedPrefranceChecking sharedPrefranceChecking =
      SharedPrefranceChecking();
      sharedPrefranceChecking.IsUserRejised(
          isRegistAction: (s)   {
            // HttpHeader().setAuthHeader(s.token!, Bearer: "Bearer__"),
            // NavigationService().replacementPage(path: HomeScreen())
          String email = s.email! ;
            String pass = "12345678" ;
          String emailkey = authBloc.emailKey;
          String passkey = authBloc.passKey;
            authBloc.signeInAsAdmin(map: { emailkey : email,  passkey : pass});

         setState(() {
            isRegist = true;

         });

          },
          NotRegistAction: () => {
            setState(() {
              isInitScreen = true;

            })
          });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: isInitScreen ? 200.h : 0.h,
            child: Center(
                child: Icon(
              Icons.login,
              size: 100.r,
              color: Colors.white,
            )),
            decoration: BoxDecoration(
              color: Color(0xffd80808),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100.r),
                bottomRight: Radius.circular(100.r),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: DataSourceBlocListener<UserModule>(
                bloc: authBloc.userBloc,
                loading: () {
                  setState(() {
                    isloading = true;
                  });
                },
                success: (UserModule? data) {
                  data;
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen().animate().moveX(duration: Duration(milliseconds: 1000));
                  }));
                  setState(() {
                    isloading = false;
                  });
                },
                failure: (error, dynamic Function() callback) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("خطا"),
                          content: Text(
                              "رجاء من تاكد من صحة البريد الالكتروني و كلمة المرور"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Ok"))
                          ],
                        )
                            .animate()
                            .scale(duration: Duration(milliseconds: 200))
                            .fadeIn(
                              duration: Duration(milliseconds: 500),
                            );
                      });
                  setState(() {
                    isloading = false;
                  });
                },
                child: isRegist ?
                    Container(
                      height: MediaQuery.of(context).size.height ,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text("يتم تسجيل الدخول"),
                      ))

                    :  SigneInWidgets(
                  isloading: isloading,
                  title: Text(
                    "Login",
                    style: TextStyle(
                        color: LightColors.titelTextColor, fontSize: 25.sp),
                  ),
                  emaalHint: "Email",
                  passwordHint: "Password",
                  signeInButton: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: LightColors.primaryColors,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Center(
                            child: Text("Login",
                                style: TextStyle(
                                    color: LightColors.titelTextColor2,
                                    fontSize: 18.sp)))),
                  ),
                  signeInButtonLoading: CircularProgressIndicator(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  submit: (email, password) {
                    var data = {
                      "${authBloc.emailKey}": email,
                      "${authBloc.passKey}": password
                    };
                    authBloc.signeInAsAdmin(map: data);
                  },
                ),
              ),
            ),
          ).animate().fadeIn(
                delay: Duration(milliseconds: 200),
                duration: Duration(milliseconds: 500),
              ),
        ],
      ),
    );
  }
}
