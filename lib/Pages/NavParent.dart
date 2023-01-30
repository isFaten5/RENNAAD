//import 'package:circlight/Pages/Pick-Up.dart';
import 'package:circlight/Pages/AnnouncementParent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:circlight/Pages/tabs/PrivateAnnoun.dart';
import 'package:circlight/Pages/tabs/PublicAnnoun.dart';
import 'CreateParent.dart';

import 'CreateStudent.dart';

import 'DelegatorList.dart';
import 'ListDelegator.dart';
import 'ParentHome.dart';
import 'Pick_up.dart';
import 'base_screen.dart';
import 'displayParent.dart';
import 'displayStudent.dart';

import 'edit5.dart';
import 'editStudent.dart';
import 'StudentAssign.dart';
import 'package:circlight/Pages/GenaralSearch.dart';
import 'package:circlight/Pages/StudentAssign.dart';
import 'package:circlight/Pages/viewprofileParent.dart';
import 'package:circlight/Pages/viewprofileStudent.dart';

class NavParent extends StatefulWidget {
  final int TabValue;

  const NavParent({
    super.key,
    required this.TabValue,
  });

  @override
  State<NavParent> createState() => _NavParent();
}

class _NavParent extends State<NavParent> {
  SetTab() {
    setState(() {
      switch (widget.TabValue) {
        case 0:
          currentScreen = ListDelegator();
          Tab = 0;
          break;
        case 1:
          Tab = 1;
          break;

        case 10:
          currentScreen = ParentHome();
          Tab = 10;
          break;

        case 4:
          currentScreen = FeaturedScreenX();
          Tab = 4;
          break;
        case 14:
          currentScreen = AnnouncementParent();
          Tab = 14;
          break;
      }
    });
  }

  int _count = 0;
  int Tab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = ListDelegator();

  @override
  Widget build(BuildContext context) {
    final List<Widget> Screens = [
      BaseScreen(),
      Paretdisplay(),
      Studentdispaly(),
    ];
    SetTab();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          //currentScreen = Requests();
                          Tab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              //     padding: const EdgeInsets.only(right: 50),
                              child: Align(
                            child: Column(children: [
                              SizedBox(
                                height: 11,
                              ),
                              Image.asset("assets/images/REQ2.png",
                                  width: 25,
                                  height: 25,
                                  color: Tab == 3
                                      ? Color(0xff42c98d)
                                      : Color.fromARGB(255, 167, 166, 166)),
                            ]),
                          )),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            //  padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'الطلبات',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Tab == 3
                                      ? Color(0xff42c98d)
                                      : Colors.grey),
                            ),
                          )

                          // Text
                          // Column
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => NavParent(
                                        TabValue: 14,
                                        // documentId: widget.documentId,
                                      )));
                          currentScreen = AnnouncementParent();
                          Tab = 14;
                        });
                        /* setState(() {
                          currentScreen = Paretdisplay();
                          Tab = 2;
                        });*/
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              //     padding: const EdgeInsets.only(right: 50),
                              child: Align(
                            child: Column(children: [
                              SizedBox(
                                height: 11,
                              ),
                              Image.asset("assets/images/announ.png",
                                  width: 25,
                                  height: 25,
                                  color: Tab == 13
                                      ? Color(0xff42c98d)
                                      : Color.fromARGB(255, 167, 166, 166)),
                            ]),
                          )),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            //  padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'الإعلانات',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Tab == 13
                                      ? Color(0xff42c98d)
                                      : Colors.grey),
                            ),
                          ),
                          // Text
                          // Column
                        ],
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => NavParent(
                                    TabValue: 4,
                                    // documentId: widget.documentId,
                                  )));
                      currentScreen = FeaturedScreenX();
                      Tab = 4;
                    });
                    /* setState(() {
                          currentScreen = Paretdisplay();
                          Tab = 2;
                        });*/
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          //     padding: const EdgeInsets.only(right: 50),
                          child: Align(
                        child: Column(children: [
                          SizedBox(
                            height: 11,
                          ),
                          Image.asset("assets/images/route.png",
                              width: 25,
                              height: 25,
                              color: Tab == 4
                                  ? Color(0xff42c98d)
                                  : Color.fromARGB(255, 167, 166, 166)),
                        ]),
                      )),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        //  padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          'أستلام الطفل',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color:
                                  Tab == 133 ? Color(0xff42c98d) : Colors.grey),
                        ),
                      ),
                      // Text
                      // Column
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => NavParent(
                                          TabValue: 0,
                                          // documentId: widget.documentId,
                                        )));
                            currentScreen = ListDelegator();
                            Tab = 0;
                          });
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  //    padding:
                                  //        const EdgeInsets.only(right: 50),
                                  child: Align(
                                child: Column(children: [
                                  SizedBox(
                                    height: 11,
                                  ),
                                  Image.asset("assets/images/delegate.png",
                                      width: 25,
                                      height: 25,
                                      color: Tab == 0
                                          ? Color(0xff42c98d)
                                          : Color.fromARGB(255, 167, 166, 166)),
                                ]),
                              )),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                //   padding:
                                //      const EdgeInsets.only(right: 50),
                                child: Text(
                                  'قائمة المفوضين',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Tab == 0
                                          ? Color(0xff42c98d)
                                          : Colors.grey),
                                ),
                              )
                            ])),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => NavParent(
                                        TabValue: 10,
                                      )));
                          currentScreen = ParentHome();
                          Tab = 10;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              //     padding: const EdgeInsets.only(right: 50),
                              child: Align(
                            child: Column(children: [
                              SizedBox(
                                height: 11,
                              ),
                              Image.asset("assets/images/homepage.png",
                                  width: 25,
                                  height: 25,
                                  color: Tab == 10
                                      ? Color(0xff42c98d)
                                      : Color.fromARGB(255, 167, 166, 166)),
                            ]),
                          )),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            //  padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'الرئيسية',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Tab == 10
                                      ? Color(0xff42c98d)
                                      : Colors.grey),
                            ),
                          )
                          // Text
                          // Column
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
