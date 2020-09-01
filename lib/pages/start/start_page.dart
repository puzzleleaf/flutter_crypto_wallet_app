import 'package:crypto_wallet/pages/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Color(0xff347AF0),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 50),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 120,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: ScreenUtil().setWidth(122),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  color: Colors.white.withOpacity(0.56),
                ),
              ),
              Text(
                'WHOLLET',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(48),
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              Spacer(),
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return SignInPage();
                  }));
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Color(0xff347af0),
                  ),
                ),
                child: Container(
                  width: ScreenUtil().setWidth(160),
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      color: Color(0xff347AF0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'Sign Up?',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
