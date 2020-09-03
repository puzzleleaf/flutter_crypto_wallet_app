import 'package:crypto_wallet/application/auth/sign_up_form/bloc/sign_up_form_bloc.dart';
import 'package:crypto_wallet/domain/core/value_validators.dart';
import 'package:crypto_wallet/infrastructure/auth/auth_failure_or_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormBloc, SignUpFormState>(
      listener: (context, state) {
        if (state.authFailureOrSuccess == AuthFailureOrSuccess.success()) {
          showSnackBar(context, SnackBar(
            backgroundColor: Colors.blue,
            content: Text('Success'),
          ));
        } else if (state.authFailureOrSuccess == AuthFailureOrSuccess.emailAlreadyInUse()) {
          showSnackBar(context, SnackBar(
            backgroundColor: Colors.red,
            content: Text('Email Already In Use'),
          ));
        } else if (state.authFailureOrSuccess == AuthFailureOrSuccess.invalidEmailAndPassword()) {
          showSnackBar(context, SnackBar(
            backgroundColor: Colors.red,
            content: Text('InvalidEmailAndPassword'),
          ));
        } else if (state.authFailureOrSuccess == AuthFailureOrSuccess.serverError()) {
          showSnackBar(context, SnackBar(
            backgroundColor: Colors.red,
            content: Text('Server Error'),
          ));
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 30,
            bottom: 50,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Form(
            autovalidate: context.bloc<SignUpFormBloc>().state.showErrorMessages,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: <Widget>[
                    TextFormField(
                      autofocus: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email address',
                      ),
                      autocorrect: false,
                      onChanged: (value) => context
                          .bloc<SignUpFormBloc>()
                          .add(SignUpFormEvent.emailChange(value)),
                      validator: (_) => validateEmailAddress(
                              context.bloc<SignUpFormBloc>().state.emailAddress)
                          ? null
                          : "Invalid Email",
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      autofocus: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                      autocorrect: false,
                      onChanged: (value) => context
                          .bloc<SignUpFormBloc>()
                          .add(SignUpFormEvent.passwordChange(value)),
                      obscureText: true,
                      validator: (_) => validatePassword(
                              context.bloc<SignUpFormBloc>().state.password)
                          ? null
                          : 'Short Password',
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        context.bloc<SignUpFormBloc>().add(
                            SignUpFormEvent.registerWithEmailAndPassword());
                      },
                      color: Color(0xff347AF0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color(0xff347af0),
                        ),
                      ),
                      child: Container(
                        width: 160,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          "Let's Get Started",
                          style: TextStyle(
                            color: Colors.white,
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
                          'Already have an account? ',
                          style: TextStyle(
                            color: Color(0xff485068),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login?',
                            style: TextStyle(
                              color: Color(0xff347AF0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showSnackBar(BuildContext context, Widget snackBar) {
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
