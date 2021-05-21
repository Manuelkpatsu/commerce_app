import 'package:commerceapp/utils/color_text_styles.dart';
import 'package:commerceapp/view/screens/account/forgot_password_screen.dart';
import 'package:commerceapp/view/screens/account/seller_registration_screen.dart';
import 'package:commerceapp/view/widgets/input_decorator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  // Add validate email function.
  String _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email cannot be empty.';
    }
    return null;
  }

  // Add validate password function.
  String _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty.';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: _appBarTitle(), centerTitle: true),
        body: _body());
  }

  Widget _appBarTitle() {
    return Text('Login', style: kAppBarText);
  }

  Widget _body() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _title(),
              SizedBox(height: 40),
              _emailTitle(),
              SizedBox(height: 5),
              _emailTextField(),
              SizedBox(height: 20),
              _passwordTitle(),
              SizedBox(height: 5),
              _passwordTextField(),
              SizedBox(height: 20),
              _rememberMeAndForgotPassword(),
              SizedBox(height: 60),
              _signInButton(),
              SizedBox(height: 30),
              _register(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Text('Wiaah'.toUpperCase(),
        textAlign: TextAlign.center,
        style: kBodyText.copyWith(
            color: kPrimaryAccent, fontSize: 40, fontWeight: FontWeight.w600));
  }

  Widget _emailTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text('Email',
          style: kBodyText.copyWith(
              color: kGrey, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
        controller: _emailController,
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        validator: _validateEmail,
        decoration: CustomInputDecorator.textFieldStyle(
            borderRadius: BorderRadius.circular(10),
            hintText: 'Email',
            hintStyle: kBodyText.copyWith(color: kLighterGrey, fontSize: 14),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 13)));
  }

  Widget _passwordTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text('Password',
          style: kBodyText.copyWith(
              color: kGrey, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
        controller: _passwordController,
        autofocus: false,
        obscureText: true,
        textInputAction: TextInputAction.done,
        validator: _validatePassword,
        decoration: CustomInputDecorator.textFieldStyle(
            borderRadius: BorderRadius.circular(10),
            hintText: 'Password',
            hintStyle: kBodyText.copyWith(color: kLighterGrey, fontSize: 14),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 13)));
  }

  Widget _rememberMeAndForgotPassword() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_rememberMeCondition(), _forgotPassword()],
    );
  }

  Widget _rememberMeCondition() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: _rememberMe,
          activeColor: kPrimaryAccent,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          onChanged: (value) {
            setState(() {
              _rememberMe = value;
            });
          },
        ),
        _rememberMeText()
      ],
    );
  }

  Widget _rememberMeText() {
    return Text('Remember me',
        style: kBodyText.copyWith(color: kLighterGrey, fontSize: 14));
  }

  Widget _forgotPassword() {
    return TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
          );
        },
        child: Text('Forgot Password?',
            style: kBodyText.copyWith(color: kPrimaryAccent, fontSize: 14)));
  }

  Widget _signInButton() {
    return MaterialButton(
      height: 50,
      color: kPrimaryAccent,
      elevation: 0,
      minWidth: MediaQuery.of(context).size.width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: _signIn,
      child: Text('Sign In',
          style: kBodyText.copyWith(
              color: kWhite, fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }

  Widget _register() {
    return RichText(
        text: TextSpan(
            text: "Don't have an account?",
            style: kBodyText.copyWith(color: kGrey, fontSize: 14),
            children: <TextSpan>[
          TextSpan(
              text: ' Register',
              style: kBodyText.copyWith(color: kPrimaryAccent, fontSize: 14),
              recognizer: TapGestureRecognizer()..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellerRegistrationScreen()),
                );
              }
          )
        ]));
  }

  void _signIn() {
    if (_formKey.currentState.validate()) {
      print('form submitted');
    }
  }
}
