import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circlight/constants/color.dart';
import 'package:circlight/constants/text_style.dart';
import 'package:circlight/data/model.dart';
import 'package:circlight/page/pag.dart';
import 'package:circlight/widgets/custom_paint.dart';

import '../Pages/AnnouncementParent.dart';
import '../Pages/ListDelegator.dart';
import '../Pages/ListRequest.dart';
import '../Pages/ParentHome.dart';
import '../Pages/Pick_up.dart';
import '../Pages/Req.dart';
import '../Screens/Signup/RequestForm.dart';

class HomePage2 extends StatefulWidget {
  final int TabValue;
  const HomePage2({
    Key? key,
    required this.TabValue,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  @override
  int selectBtn = 0;
  Widget currentScreen = ListDelegator();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    print("333333333333333333333");
    print("######################################");
    print("+++++++++++++++++");
    print("333333333333333333333");
    print("######################################");
    print("333333333333333333333");
    print("######################################");
    print("333333333333333333333");
    print("######################################");
    print(selectBtn);
    print(selectBtn);

    setState(() {
      switch (selectBtn) {
        case 4:
          currentScreen = ParentHome();
          selectBtn = 4;
          break;
        case 3:
          currentScreen = ListDelegator();
          selectBtn = 3;
          break;
        case 2:
          currentScreen = FeaturedScreenX();
          selectBtn = 2;
          break;
        case 1:
          currentScreen = AnnouncementParent();
          selectBtn = 1;
          break;
        case 0:
          currentScreen = ListRequest();
          selectBtn = 0;
          break;
        case 5:
          currentScreen = ListRequest();
          selectBtn = 0;
          break;
        case 6:
          setState(() {
            currentScreen = RequestForm();
          });

          selectBtn = 0;
          break;
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: SizedBox(
          height: 50,
          child: BottomAppBar(
              elevation: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: navigationBar(),
              ))),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AnimatedContainer navigationBar() {
    return AnimatedContainer(
      height: 55.0,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(selectBtn == 0 ? 0.0 : 20.0),
          topRight:
              Radius.circular(selectBtn == navBtn.length - 1 ? 0.0 : 20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < navBtn.length; i++)
            GestureDetector(
              onTap: () => setState(() => selectBtn = i),
              child: iconBtn(i),
            ),
        ],
      ),
    );
  }

  SizedBox iconBtn(int i) {
    bool isActive = selectBtn == i ? true : false;

    var height = isActive ? 55.0 : 0.0;
    var width = isActive ? 50.0 : 0.0;
    return SizedBox(
      width: 58.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              height: height,
              width: width,
              duration: const Duration(milliseconds: 600),
              child: isActive
                  ? CustomPaint(
                      painter: ButtonNotch(),
                    )
                  : const SizedBox(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              width: 18,
              height: 18,
              navBtn[i].imagePath,
              color: isActive ? const Color(0xff0da6c2) : Colors.grey,
              scale: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                navBtn[i].name,
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    color: isActive ? const Color(0xff0da6c2) : Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
