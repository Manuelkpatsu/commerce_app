import 'package:commerceapp/utils/color_text_styles.dart';
import 'package:commerceapp/view/widgets/input_decorator.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  // Add validate email function.
  String _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email cannot be empty.';
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
    return Text('Forgot your password', style: kAppBarText);
  }

  Widget _body() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            _instruction(),
            SizedBox(height: 15),
            _emailTextField(),
            SizedBox(height: 20),
            _sendLinkButton()
          ],
        ),
      ),
    );
  }

  Widget _instruction() {
    return Text(
        'Enter your registered email below to receive password reset instruction.',
        style: kBodyText.copyWith(
            color: kGrey, fontSize: 14, fontWeight: FontWeight.w500));
  }

  Widget _emailTextField() {
    return TextFormField(
        controller: _emailController,
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        validator: _validateEmail,
        decoration: CustomInputDecorator.textFieldStyle(
            borderRadius: BorderRadius.circular(10),
            hintText: 'Your email address',
            hintStyle: kBodyText.copyWith(color: kLighterGrey, fontSize: 14),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 13)));
  }

  Widget _sendLinkButton() {
    return MaterialButton(
      height: 50,
      color: kPrimaryAccent,
      elevation: 0,
      minWidth: MediaQuery.of(context).size.width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: _sendLink,
      child: Text('Send reset link'.toUpperCase(),
          style: kBodyText.copyWith(
              color: kWhite, fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }

  void _sendLink() {
    if (_formKey.currentState.validate()) {
      print('form submitted');
    }
  }
}
