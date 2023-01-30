import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:circlight/another_page.dart';

import '../../../Pages/Nav.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onSaved: (email) {},
              showCursor: true,
              cursorColor: const Color(0xff42c98d),
              decoration: InputDecoration(
                filled: true, //<-- SEE HERE
                fillColor: Colors.white,
                hintText: "البريد الإلكتروني",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xff42c98d), width: 1),
                  borderRadius: BorderRadius.circular(22),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color(0xff57d77a), width: 1),
                    borderRadius: BorderRadius.circular(22)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(
                    Icons.mail,
                    color: const Color(0xff42c98d),
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                obscureText: true,
                showCursor: true,
                cursorColor: const Color(0xff42c98d),
                decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.white,
                  hintText: " الرقم السري",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color(0xff42c98d), width: 1),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: const Color(0xff57d77a), width: 1),
                      borderRadius: BorderRadius.circular(22)),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(
                      Icons.lock,
                      color: const Color(0xff42c98d),
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: Center(
              child: Container(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0xff57d77a),
                        const Color(0xff42c98d),
                        const Color(0xff0da6c2),

                        //add more colors
                      ]),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color.fromRGBO(
                                0, 0, 0, 0.57), //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                      //make color or elevated button transparent
                    ),
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => Nav(
                          TabValue: 0,
                          documentId: "",
                        ),
                      ));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 18,
                        bottom: 18,
                      ),
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
          // ************************** To TEST ************************

          // ************************** To TEST ************************
        ],
      ),
    );
  }
}
