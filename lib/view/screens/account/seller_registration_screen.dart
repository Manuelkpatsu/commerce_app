import 'package:commerceapp/utils/color_text_styles.dart';
import 'package:commerceapp/view/widgets/input_decorator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SellerRegistrationScreen extends StatefulWidget {
  @override
  _SellerRegistrationScreenState createState() =>
      _SellerRegistrationScreenState();
}

class _SellerRegistrationScreenState extends State<SellerRegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _acceptTermsAndConditions = false;

  // Add validate shop name function.
  String _validateShopName(String value) {
    if (value.isEmpty) {
      return 'Shop Name cannot be empty.';
    }
    return null;
  }

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

  // Add validate confirm password function.
  String _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'Confirm Password cannot be empty.';
    } else if (value.length < 8) {
      return 'Confirm Password must be at least 8 characters.';
    } else if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _appBarTitle(),
          centerTitle: true,
        ),
        body: _body());
  }

  Widget _appBarTitle() {
    return Text('Registration', style: kAppBarText);
  }

  Widget _body() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            _shopNameTitle(),
            SizedBox(height: 5),
            _shopNameTextField(),
            SizedBox(height: 20),
            _emailTitle(),
            SizedBox(height: 5),
            _emailTextField(),
            SizedBox(height: 20),
            _passwordTitle(),
            SizedBox(height: 5),
            _passwordTextField(),
            SizedBox(height: 20),
            _confirmPasswordTitle(),
            SizedBox(height: 5),
            _confirmPasswordTextField(),
            SizedBox(height: 30),
            _termsAndConditions(),
            SizedBox(height: 20),
            _signUpButton(),
            SizedBox(height: 10),
            _signIn(),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  Widget _shopNameTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text('Shop Name',
          style: kBodyText.copyWith(
              color: kGrey, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }

  Widget _shopNameTextField() {
    return TextFormField(
        controller: _shopNameController,
        autofocus: false,
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.next,
        validator: _validateShopName,
        decoration: CustomInputDecorator.textFieldStyle(
            borderRadius: BorderRadius.circular(10),
            hintText: 'Shop Name',
            hintStyle: kBodyText.copyWith(color: kLighterGrey, fontSize: 14),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 13)));
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
        textInputAction: TextInputAction.next,
        validator: _validatePassword,
        decoration: CustomInputDecorator.textFieldStyle(
            borderRadius: BorderRadius.circular(10),
            hintText: 'Password',
            hintStyle: kBodyText.copyWith(color: kLighterGrey, fontSize: 14),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 13)));
  }

  Widget _confirmPasswordTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text('Confirm Password',
          style: kBodyText.copyWith(
              color: kGrey, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }

  Widget _confirmPasswordTextField() {
    return TextFormField(
        controller: _confirmPasswordController,
        autofocus: false,
        obscureText: true,
        textInputAction: TextInputAction.done,
        validator: _validateConfirmPassword,
        decoration: CustomInputDecorator.textFieldStyle(
            borderRadius: BorderRadius.circular(10),
            hintText: 'Confirm Password',
            hintStyle: kBodyText.copyWith(color: kLighterGrey, fontSize: 14),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 13)));
  }

  Widget _termsAndConditions() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: _acceptTermsAndConditions,
          activeColor: kPrimaryAccent,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          onChanged: (value) {
            setState(() {
              _acceptTermsAndConditions = value;
            });
          },
        ),
        _termsAndConditionsText()
      ],
    );
  }

  Widget _termsAndConditionsText() {
    return RichText(
        text: TextSpan(
            text: 'I read and accept',
            style: kBodyText.copyWith(color: kGrey, fontSize: 14),
            children: <TextSpan>[
          TextSpan(
              text: ' terms and conditions',
              style: kBodyText.copyWith(color: kPrimaryAccent, fontSize: 14),
              recognizer: TapGestureRecognizer()..onTap = () {})
        ]));
  }

  Widget _signUpButton() {
    return MaterialButton(
      height: 50,
      color: kPrimaryAccent,
      elevation: 0,
      minWidth: MediaQuery.of(context).size.width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: _signUp,
      child: Text('Sign Up',
          style: kBodyText.copyWith(
              color: kWhite, fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }

  Widget _signIn() {
    return RichText(
        text: TextSpan(
            text: 'Already have an account?',
            style: kBodyText.copyWith(color: kGrey, fontSize: 14),
            children: <TextSpan>[
          TextSpan(
              text: ' Sign in',
              style: kBodyText.copyWith(color: kPrimaryAccent, fontSize: 14),
              recognizer: TapGestureRecognizer()..onTap = () {})
        ]));
  }

  void _signUp() {
    if (_formKey.currentState.validate()) {
      print('form submitted');
    }
  }
}
