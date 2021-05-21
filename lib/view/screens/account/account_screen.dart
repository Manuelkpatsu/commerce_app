import 'package:commerceapp/utils/color_text_styles.dart';
import 'package:commerceapp/view/screens/account/login_screen.dart';
import 'package:commerceapp/view/screens/account/seller_registration_screen.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('My Account', style: kAppBarText), centerTitle: true),
        body: _body());
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          _account(),
          SizedBox(height: 30),
          _alert(),
          Divider(height: 0),
          _customerService(),
          Divider(height: 0),
          _information(),
          Divider(height: 0),
          _stayConnected(),
          Divider(height: 0),
          _language(),
          SizedBox(height: 30)
        ],
      ),
    );
  }

  Widget _account() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: kBlack.withOpacity(0.05),
                blurRadius: 50,
                offset: Offset(0, 4), // changes position of shadow
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_loginButton(), SizedBox(height: 10), _signUpButton()],
        ));
  }

  Widget _loginButton() {
    return MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        height: 50,
        color: kPrimaryAccent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: Text('Login',
            style: kBodyText.copyWith(
                fontSize: 14, fontWeight: FontWeight.w500, color: kWhite)));
  }

  Widget _signUpButton() {
    return MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: kPrimaryAccent)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SellerRegistrationScreen()),
          );
        },
        child: Text('Sign Up',
            style: kBodyText.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kPrimaryAccent)));
  }

  Widget _alert() {
    return ListTile(
        leading: Image.asset(
          'assets/images/bell.png',
          width: 25,
          height: 25,
          fit: BoxFit.cover,
        ),
        title: Text('wiaah alert',
            style: kBodyText.copyWith(fontSize: 14, color: kBlack)),
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 20));
  }

  Widget _customerService() {
    return ListTile(
        leading: Image.asset(
          'assets/images/phone-call.png',
          width: 25,
          height: 25,
          fit: BoxFit.cover,
        ),
        title: Text('customer service',
            style: kBodyText.copyWith(fontSize: 14, color: kBlack)),
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 20));
  }

  Widget _information() {
    return ListTile(
        leading: Image.asset(
          'assets/images/info.png',
          width: 25,
          height: 25,
          fit: BoxFit.cover,
        ),
        title: Text('information',
            style: kBodyText.copyWith(fontSize: 14, color: kBlack)),
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 20));
  }

  Widget _stayConnected() {
    return ListTile(
        leading: Image.asset(
          'assets/images/molecular.png',
          width: 25,
          height: 25,
          fit: BoxFit.cover,
        ),
        title: Text('stay connected',
            style: kBodyText.copyWith(fontSize: 14, color: kBlack)),
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 20));
  }

  Widget _language() {
    return ListTile(
        leading: Image.asset(
          'assets/images/translate.png',
          width: 25,
          height: 25,
          fit: BoxFit.cover,
        ),
        title: Text('language',
            style: kBodyText.copyWith(fontSize: 14, color: kBlack)),
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 20));
  }
}
