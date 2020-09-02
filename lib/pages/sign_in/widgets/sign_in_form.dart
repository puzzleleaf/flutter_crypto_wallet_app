import 'package:crypto_wallet/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:crypto_wallet/domain/core/value_validators.dart';
import 'package:crypto_wallet/pages/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        print(state);
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
            autovalidate: state.showErrorMessages,
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
                          .bloc<SignInFormBloc>()
                          .add(SignInFormEvent.emailChange(value)),
                      validator: (_) => validateEmailAddress(
                              context.bloc<SignInFormBloc>().state.emailAddress)
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
                          .bloc<SignInFormBloc>()
                          .add(SignInFormEvent.passwordChange(value)),
                      obscureText: true,
                      validator: (_) => validatePassword(
                              context.bloc<SignInFormBloc>().state.password)
                          ? null
                          : 'Short Password',
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: Color(0xff347af0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(
                            SignInFormEvent.signInWithEmailAndPassword());
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
                          "Login",
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
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: Color(0xff485068),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUpPage();
                            }));
                          },
                          child: Text(
                            'Sign Up?',
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
}
