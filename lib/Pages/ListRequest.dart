import 'dart:html';

import 'package:circlight/Pages/Student.dart';
import 'package:circlight/page/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circlight/Pages/Requests.dart';

import 'CreateDelegator.dart';

class ListRequest extends StatefulWidget {
  const ListRequest({Key? key}) : super(key: key);

  @override
  _ListRequest createState() => _ListRequest();
}

class _ListRequest extends State<ListRequest> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference request =
      FirebaseFirestore.instance.collection('Student');
  CollectionReference Parent = FirebaseFirestore.instance.collection('Parent');
  List<String> docPname = [];
  List<String> StudentName = [];
  List<String> ParentName = [];
  List<String> ParentID = [];

  List<String> StudentName3 = [];
  List<String> StudentName4 = [];
  int CountStudent = -1;
  int SnapCount = 0;
  int ParentCount = -1;
  int count = 0;
  bool ShowRequest = false;
  String Show = "true";
  TextEditingController Namex = TextEditingController();
  CollectionReference ColStudent =
      FirebaseFirestore.instance.collection('Student');
  var DelegatorActive = "";
  List<bool> IsSwitch = [];
  var CountSwitch = 0;
  var IsIDExists = false;
  List<String> DelegatorID = [];

  Request Req = new Request(
      DName: "",
      Dusername: "",
      isAccepted: "false",
      isActive: "false",
      SID: "");
  var ID;
  String Active = "";
  String Accepted = "";
  late bool IsAct = true;
  var IsSwitched;
  var status = false;
  int CountItem = 9;
  bool SShow = true;

  bool isNull = true;
  String CurID = "";
  String RID = "";
  String IDS = "";
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late Animation<Offset> _transTween;
  CollectionReference reques =
      FirebaseFirestore.instance.collection('Requests');
  Future<bool> CheckForStudent(SID, RID) async {
    var ID;
    var bol = true;
    List<String> IsActive = [];

    reques.get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            //  print("fffffffffffffffffffffffff");
            //  print("StudentID");
            //  print(document["StudentID"]);
            //   print("SID:");
            //   print(CurID);
            // print(RID);
            // print(document.reference.id);
            var equal = false;

            if (RID == document.reference.id) {
              equal = false;
              // print("it should be false");
            } else if (RID != document.reference.id) {
              equal = true;
            }
            if (equal) {
              if (document["StudentID"] == SID) {
                //   print("IM IN");
                // print("222222222222222222222");
                if (document["IsActive"] == "true" &&
                    document["isAccepted"] == "true" &&
                    document["DelegatorActive"] == "true") {
                  //  print("44444444444444444444444444444444");
                  IsIDExists = true;
                  bol = false;
                }
              }
            }
          }),
        );

    if (!bol) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
    // return Future.value(false);
  }

  var SID;

  var CurrentID;
  late TabController _tabController;
  var SCount = 0;
  String Name = "";
  @override
  void initState() {
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_ColorAnimationController);
    _iconColorTween = ColorTween(begin: Colors.grey, end: Colors.grey)
        .animate(_ColorAnimationController);
    _icon2ColorTween =
        ColorTween(begin: Colors.white, end: const Color(0xff42c98d))
            .animate(_ColorAnimationController);

    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(_TextAnimationController);
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  final _selectedColor = const Color(0xff0da6c2);
  final _tabs = [
    Tab(text: 'Tab1'),
    Tab(text: 'Tab2'),
  ];
  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    print("11111111111111111111111111111111111111111111");
    //print(currentDate);
    DateTime today = DateTime.now();
    String dateStr =
        "${today.year}-${today.month}-${today.day} ${today.hour}:${today.minute}";
    print(dateStr);
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: _iconColorTween.value,
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "قائمه الطلبات ",
          textAlign: TextAlign.start,
          style: TextStyle(color: _iconColorTween.value),
        ),
        centerTitle: true,
        actions: [],
        titleSpacing: 0.0,
      ),
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: TabBarView(controller: _tabController, children: <Widget>[
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: [
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Align(
                      // alignment: Alignment(-0.85, -0.45),
                      child: Container(
                        height: 41.0,
                        width: 41.0,
                        child: FittedBox(
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => HomePage2(
                                        TabValue: 0,
                                      )));
                            },
                            elevation: 0,
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(90),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff0da6c2),
                                    Color(0xff0da6c2),
                                    Color(0xff0da6c2),
                                    Color(0xff0da6c2),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  size: 22,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                            backgroundColor: Color.fromARGB(0, 255, 253, 253),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 340,
                    //height: 230,
                    padding: EdgeInsets.only(right: 5, top: 0, left: 5),
                    child: Padding(
                      padding: EdgeInsets.only(right: 5, top: 0, left: 5),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            //  searchname = value;
                          });
                        },
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            hintText: "..بحث",
                            hintStyle: TextStyle(color: Colors.grey.shade600),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey.shade400,
                              size: 20,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(8),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300))),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 7,
                ),
                Row(children: [
                  SizedBox(
                    width: 90,
                  ),
                  SizedBox(
                    width: 182,
                  ),
                  Align(
                    alignment: Alignment(0.91, 0.9),
                    child: Text(
                      "الطلبات السابقة",
                      textAlign: TextAlign.left,
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF29294D),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ]),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("RequestParent")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      final snap = snapshot.data!.docs;

                      return FutureBuilder(
                        future: Future.wait([]),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Align(
                                child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: snap.length,
                              itemBuilder: (context, index) {
                                ShowRequest = true;
                                //  print("666666666666");
                                return ShowRequest
                                    ? Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 5, 5),
                                        child: InkWell(
                                            onTap: () {
                                              /*Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => Nav(
                                      TabValue: 5,
                                      index: 1,
                                      documentId: widget.documentId,
                                      TheValue: parentName.text,
                                      whichpag: 1,
                                      Confirm: false,
                                      DropDown: isDrop,
                                    ),
                                  ));*/
                                            },
                                            child: Container(
                                              width: 397.6,
                                              height: 58.3,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Stack(children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  11, 4, 4, 0),
                                                      child: Text(
                                                        snap[index]["Date"],
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ]),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.77, -0.59),
                                                    child: Text(
                                                      snap[index]['Title'],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF101213),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  /*Align(
                                                alignment: AlignmentDirectional(
                                                    0.77, -0.49),
                                                child: Text(
                                                  snap[index]['Type'],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF101213),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),*/
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.77, 0.35),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Text(
                                                        snap[index]['Content'],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.94, 0.08),
                                                    child: Container(
                                                      width: 3,
                                                      height: 42,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF29294D),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )))
                                    : SizedBox(
                                        height: 0,
                                      );
                              },
                            ));
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ); /////////////
                    } else {
                      return const Text("");
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  SizedBox(
                    width: 15,
                  ),
                ]),
              ],
            ),
          ),
        ),
        Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Align(
                          //  alignment: Alignment(-0.98, -0.97),
                          child: Container(
                            height: 35.0,
                            width: 35.0,
                            child: FittedBox(
                              child: FloatingActionButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => CreateDelegator(),
                                  ));
                                },
                                elevation: 0,
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 6,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(90),
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xff0da6c2),
                                        const Color(0xff0da6c2),
                                        //       const Color(0xff57d77a)
                                      ],
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor:
                                    Color.fromARGB(0, 255, 253, 253),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 7,
                    ),

                    /*   CountItem != 0
                        ? StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("Requests")
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                final snap = snapshot.data!.docs;

                                return FutureBuilder(
                                  future: Future.wait([
                                    GetStudentName(snap),
                                    Fill(),
                                    getDelegatorID(snap)
                                  ]),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Align(
                                          child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount: snap.length,
                                        itemBuilder: (context, index) {
                                          //dynamic v = docIDS[index];
                                          //   IsIDExists = false;

                                          RID = snap[index].reference.id;
                                          ShowRequest = false;

                                          Accepted = snap[index]["isAccepted"];

                                          if (Accepted == "Waiting") {
                                            ShowRequest = true;
                                            //print(RID);
                                            //print("MMMMMMMMMMMMMMM");
                                            //print(Active);
                                            // print(IsAct);

                                          }

                                          //   var Co = index;
                                          /*  RID = snap[index]
                                                        .reference
                                                        .id;*/

                                          // print(
                                          //     "aaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                          /* Active =
                                                        snap[index]["IsActive"];
                                                    // print(RID);
                                                    //   print(
                                                    //      "+++++++++++++++++++++++++++");
                                                    //print(IsAct);
                                                    if (Active == "Pending") {
                                                      IsAct = false;
                                                      //print(RID);
                                                      //print("MMMMMMMMMMMMMMM");
                                                      //print(Active);
                                                      // print(IsAct);

                                                      if (Active == "true") {
                                                        Req.UpdateRequest(
                                                            RID,
                                                            "IsActive",
                                                            "false");
                                                      }
                                                    }
                                                    if (snap[index]
                                                            ["isAccepted"] ==
                                                        true) {
                                                      ShowRequest = true;
                                                    } else if (snap[index]
                                                            ["isAccepted"] ==
                                                        false) {
                                                      ShowRequest = false;
                                                    }*/
                                          return ShowRequest
                                              ? Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 5, 5, 5),
                                                  child: Container(
                                                    width: 367.6,
                                                    height: 65.3,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(11,
                                                                      4, 4, 0),
                                                          child: Text(
                                                            snap[index]["Date"],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 7,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.9, 0.10),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: Container(
                                                              width: 50.7,
                                                              height: 22,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.2),
                                                                ),
                                                              ),
                                                              child: Text(
                                                                  'لم يقبل بعد',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .grey)),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.78, -0.59),
                                                          child: Text(
                                                            " المفوض" +
                                                                " " +
                                                                snap[index][
                                                                    'DelegatorName'],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.77, 0.35),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              " "
                                                                      "  لطالب" +
                                                                  " " +
                                                                  StudentName[
                                                                      index],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.94, 0.08),
                                                          child: Container(
                                                            width: 3,
                                                            height: 42,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF29294D),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ))
                                              : SizedBox(
                                                  height: 0,
                                                );
                                        },
                                      ));
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ); /////////////
                              } else {
                                return const Text("");
                              }
                            },
                          )
                        : Text("aaaaaaaaaaaaaaaaa"),*/
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 15,
                      ),
                      Align(
                        alignment: Alignment(0.91, 0.9),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              // <-- Icon
                              Icons.arrow_downward_sharp,
                              size: 13.0,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "إلغاء التفويض",
                              textAlign: TextAlign.left,
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF29294D),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 215,
                      ),
                    ]),

                    //here im

                    /*   CountItem != 0
                        ? StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("Requests")
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                final snap = snapshot.data!.docs;

                                return FutureBuilder(
                                  future: Future.wait([
                                    GetStudentName(snap),
                                    Fill(),
                                    getDelegatorID(snap)
                                  ]),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Align(
                                          child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount: snap.length,
                                        itemBuilder: (context, index) {
                                          //dynamic v = docIDS[index];
                                          //   IsIDExists = false;

                                          RID = snap[index].reference.id;
                                          ShowRequest = false;

                                          Accepted = snap[index]["isAccepted"];

                                          if (Accepted == "Waiting") {
                                            ShowRequest = true;
                                            //print(RID);
                                            //print("MMMMMMMMMMMMMMM");
                                            //print(Active);
                                            // print(IsAct);

                                          }

                                          //   var Co = index;
                                          /*  RID = snap[index]
                                                        .reference
                                                        .id;*/

                                          // print(
                                          //     "aaaaaaaaaaaaaaaaaaaaaaaaaaa");
                                          /* Active =
                                                        snap[index]["IsActive"];
                                                    // print(RID);
                                                    //   print(
                                                    //      "+++++++++++++++++++++++++++");
                                                    //print(IsAct);
                                                    if (Active == "Pending") {
                                                      IsAct = false;
                                                      //print(RID);
                                                      //print("MMMMMMMMMMMMMMM");
                                                      //print(Active);
                                                      // print(IsAct);

                                                      if (Active == "true") {
                                                        Req.UpdateRequest(
                                                            RID,
                                                            "IsActive",
                                                            "false");
                                                      }
                                                    }
                                                    if (snap[index]
                                                            ["isAccepted"] ==
                                                        true) {
                                                      ShowRequest = true;
                                                    } else if (snap[index]
                                                            ["isAccepted"] ==
                                                        false) {
                                                      ShowRequest = false;
                                                    }*/
                                          return ShowRequest
                                              ? Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 5, 5, 5),
                                                  child: Container(
                                                    width: 367.6,
                                                    height: 65.3,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(11,
                                                                      4, 4, 0),
                                                          child: Text(
                                                            snap[index]["Date"],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 7,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.9, 0.10),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: Container(
                                                              width: 50.7,
                                                              height: 22,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.2),
                                                                ),
                                                              ),
                                                              child: Text(
                                                                  'لم يقبل بعد',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .grey)),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.78, -0.59),
                                                          child: Text(
                                                            " المفوض" +
                                                                " " +
                                                                snap[index][
                                                                    'DelegatorName'],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.77, 0.35),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              " "
                                                                      "  لطالب" +
                                                                  " " +
                                                                  StudentName[
                                                                      index],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.94, 0.08),
                                                          child: Container(
                                                            width: 3,
                                                            height: 42,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF29294D),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ))
                                              : SizedBox(
                                                  height: 0,
                                                );
                                        },
                                      ));
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ); /////////////
                              } else {
                                return const Text("");
                              }
                            },
                          )
                        : Text("aaaaaaaaaaaaaaaaa"),*/
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  Future GetStudentName(snap) async {
    // print("Entered!");
    int count = 0;
    //  StudentName.clear();
    String n = "lllllllllllllllllll";
    List<String> StudentID = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        print("xxxxxxxxxxxxx");
        print(snap[i]["StudentID"]);
      }
    } catch (error) {
      //   print("error");
    }
    // print("SnapppppppppppppppppppppppppppppppCount");
    // print(SnapCount);
    for (var j = 0; j < StudentID.length; j++) {
      //    print("object");
      //   print(StudentID[j]);
      await ColStudent.doc(StudentID[j]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //  print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        // print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;
        // print(value["Name"]);

        StudentName.add(value["Name"]);
        // print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }

    // print(StudentName[0]);
  }

  Future GetStudentName3(snap) async {
    // print("Entered!");
    int count = 0;

    String n = "lllllllllllllllllll";
    List<String> StudentID = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        print("sssssssssssssaaaaaaaaaaaaaaaaaa");
        print(snap[i]["StudentID"]);
      }
    } catch (error) {
      //   print("error");
    }
    // print("SnapppppppppppppppppppppppppppppppCount");
    // print(SnapCount);
    for (var j = 0; j < StudentID.length; j++) {
      //    print("object");
      //   print(StudentID[j]);
      await ColStudent.doc(StudentID[j]).get().then((value) {
        //StudentName.add(value.get('Name'));
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;
        // print(value["Name"]);

        StudentName3.add(value["Name"]);
        print(value["Name"]);
        print("Starteddd");
        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });
    }

    // print(StudentName[0]);
  }

  Future GetStudentName4(snap) async {
    // print("Entered!");
    int count = 0;

    String n = "lllllllllllllllllll";
    List<String> StudentID = [];
    print("innnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn!!!!!!!!!!!!!!");
    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
        print("ضضضضضضضضضضضضضضضضضضضضضض");
        print(snap[i]["StudentID"]);
      }
    } catch (error) {
      //   print("error");
    }
    // print("SnapppppppppppppppppppppppppppppppCount");
    // print(SnapCount);
    for (var j = 0; j < StudentID.length; j++) {
      //    print("object");
      //   print(StudentID[j]);
      await ColStudent.doc(StudentID[j]).get().then((value) {
        //StudentName.add(value.get('Name'));
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // print("StID");
        print(StudentID[j]);
        // print("3333333333333333333333");
        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;
        // print(value["Name"]);

        StudentName4.add(value["Name"]);
        print(value["Name"]);
        print("Starteddd");

        // print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
      });

      print("ennnnnnnnnnnnnnnddddddddddddddddddddd");
    }

    // print(StudentName[0]);
  }

  Future getDelegatorID(snap) async {
    /* print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ");
    print("DDDDDDDDDDDDDDDDDDDDDDDDDDD");
    print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
    print("CCCCCCCCCCCCCCCCCCCCCCCCCCC");
    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ");
    print("DDDDDDDDDDDDDDDDDDDDDDDDDD");
    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ");
    print("VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV");
    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ");
    print("WWWWWWWWWWWWWWWWWWWWWWWWWW");
    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ");
    print("HHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
    print("QQQQQQQQQQQQQQQQQQQQQQQQQQQ");
*/
    List<String> DelegatorUsr = [];
    List<String> ID = [];
    await FirebaseFirestore.instance
        .collection("Delegator")
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              // print(document["UserName"]);
              // print(document["ID"]);
              DelegatorUsr.add(document["UserName"]);
              ID.add(document["ID"]);
            }));
  }

  Widget CreateDialog5(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text(' حذف التفويض   ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: const Text('هل انت متأكد انك تريد حذف التفويض ؟',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);

              Req.DeleteRequests(RID);
            },
            child: const Text("موافق",
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 24, 24),
                    fontWeight: FontWeight.bold))),
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: const Text('إلغاء'),
        ),
      ],
    );
  }

  Future GetNames(snap) async {
    List<String> StudentID = [];

    try {
      for (var i = 0; snap[i] != null; i++) {
        SnapCount += 1;
        StudentID.add(snap[i]["StudentID"]);
      }
    } catch (error) {
      //   print("error");
    }
    //print("SnapppppppppppppppppppppppppppppppCount");
    print(SnapCount);
    for (var j = 0; j < StudentID.length; j++) {
      await request.doc(StudentID[j]).get().then((value) {
        //StudentName.add(value.get('Name'));
        //   print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        //   print("StID");
        //   print(StudentID[j]);

        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;

        StudentName.add(value["Name"]);
        ParentID.add(value["ParentId"]);
        //  print(value["ParentId"]);

        //  print("Starteddd");
        for (var i = 0; i < StudentName.length; i++) {
          //    print("*******************************************");
          // print(StudentName[i]);
        }
      });
    }
//--------------------------------
    //  print("........................................................");
    //  print(ParentID.length);
    for (var j = 0; j < ParentID.length; j++) {
      //   print(ParentID[j]);
      await Parent.doc(ParentID[j]).get().then((value) {
        //StudentName.add(value.get('Name'));

        //    print("pID");
        //   print(ParentID[j]);

        //  print(StudentName[0]);
        // Access your after your get the data
        count = 1;

        ParentName.add(value["Name"]);
        //   print("=============================================");
        //  print(value["Name"]);
        //   print("Starteddd");
      });
    }

    // print(StudentName[0]);
  }

  Widget CreateDialog33(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text("!تنبيه",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: const Text(
          'يوجد لهذا الطالب  مفوض مفعل الرجاء إلغاء التفعيل لتفويض  آخر ',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("موافق",
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 24, 24),
                    fontWeight: FontWeight.bold))),
      ],
    );
  }

  Future Fill() async {
    //var count = 0;
    //   print("99999999999999999999999999999999999");
    await FirebaseFirestore.instance.collection("Requests").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(document["Email"]);

            var bol;
            if (document["IsActive"] == "true" &&
                document["isAccepted"] == "true") {
              bol = true;
              IsSwitch.add(bol);
            } else if (document["IsActive"] == "false" &&
                document["isAccepted"] == "true") {
              bol = false;
              IsSwitch.add(bol);
            }

            //  count += 1;
          }),
        );
    print("rend of this");
  }

  Widget CreateDialog3(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text('حذف الطلب',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: const Text('هل انت متأكد انك تريد طلب التفويض هذا؟',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);

              Req.DeleteRequests(ID);
            },
            child: const Text("موافق",
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 24, 24),
                    fontWeight: FontWeight.bold))),
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: const Text('إلغاء'),
        ),
      ],
    );
  }
}
