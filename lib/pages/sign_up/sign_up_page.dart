import 'package:crypto_wallet/application/auth/sign_up_form/bloc/sign_up_form_bloc.dart';
import 'package:crypto_wallet/injection.dart';
import 'package:crypto_wallet/pages/sign_up/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffE0E9F8),
        centerTitle: true,
        title: Text(
          'Create Account',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Color(0xffE0E9F8),
          width: MediaQuery.of(context).size.width,
          child: CustomScrollView(
            reverse: true,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/office.png',
                      width: ScreenUtil().setWidth(308),
                    ),
                    Expanded(
                      child: BlocProvider(
                        create: (_) => getIt<SignUpFormBloc>(),
                        child: SignUpForm(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
