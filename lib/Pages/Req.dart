import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circlight/Pages/Nav.dart';
import 'package:circlight/Pages/RequestParent.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
//import '../../Login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> with TickerProviderStateMixin {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  final _key = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();
  final _key3 = GlobalKey<FormState>();
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int Index = 0;
  bool isWrong = false;
  bool isCorrect = false;
  bool More = false;
  final formKeyDelegator = GlobalKey<FormState>();
  int _changedNumber = 0;
  int _selectedNumber = 1;
  List<String> docEmails = [];
  List<String> docUserName = [];
  TextEditingController Content = TextEditingController();
  TextEditingController StudentUsername = TextEditingController();
  //for Email uniqueness

  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _UsernamelContoller = TextEditingController();
  TextEditingController _ConformpasswordController = TextEditingController();
  TextEditingController _ID = TextEditingController();
  TextEditingController _Phonenumber = TextEditingController();
  TextEditingController _Name = TextEditingController();
  TextEditingController StudentName = TextEditingController();
  TextEditingController OtherController = TextEditingController();
  bool Other = false;
  late Animation _colorTween, _iconColorTween, _icon2ColorTween;
  late TextEditingController controller;
  var Real;
  late FixedExtentScrollController scrollController;
  late AnimationController _ColorAnimationController;
  late AnimationController _TextAnimationController;
  late Animation<Offset> _transTween;
  int NumIndex = 0;
  RequestParent ReqParent2 = new RequestParent(
      Type: "", Content: "", Date: "", ParentID: "", Title: "");
  late String value = "-";
  var ParentID = "G2tniHX0FfIB7dQWV616";
  final Reason = ["-", "غياب", "ظرف صحي", "أخرى"];
  Future getEmail() async {
    await FirebaseFirestore.instance.collection("Delegator").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(document["Email"]);
            docEmails.add(document["Email"]);
          }),
        );
  }

  //for username uniqueness
  Future getUserName() async {
    await FirebaseFirestore.instance.collection("Delegator").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docUserName.add(document["UserName"]);
          }),
        );
  }

  List<String> UsernameList = [];
  Future GetStudents() async {
    await FirebaseFirestore.instance.collection("Student").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            //DelegatorList.add(document["UserName"]);
            UsernameList.add(document["UserName"]);
          }),
        );
  }

  @override
  void initState() {
    controller = TextEditingController(text: Reason[Index]);
    scrollController = FixedExtentScrollController(initialItem: Index);
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_ColorAnimationController);
    _iconColorTween = ColorTween(begin: Colors.white, end: Colors.grey)
        .animate(_ColorAnimationController);

    _icon2ColorTween =
        ColorTween(begin: Colors.white, end: const Color(0xff42c98d))
            .animate(_ColorAnimationController);
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    super.dispose();
  }

  bool _passwordVisible = false;
  bool _passwordVisible2 = false;
  var loading = false;
  @override
  Widget build(BuildContext context) {
    CollectionReference Parent =
        FirebaseFirestore.instance.collection("Delegator");
    getEmail();
    getUserName();
    GetStudents();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 195,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/formbackground.png',
                            width: double.infinity,
                            height: 230,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: ClipRRect(
                              child: Container(
                                width: double.infinity,
                                height: 210,
                                decoration: BoxDecoration(
                                  color: Color(0x48000000),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/background3.png',
                                    ).image,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.04, 0.88),
                                            child: Text(
                                              'إنشاء طلب',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 25,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Form(
                          key: _key,
                          child: Column(
                            children: [
                              Directionality(
                                textDirection: ui.TextDirection.rtl,
                                child: SizedBox(
                                  // <-- SEE HERE
                                  width: 360,
                                  // height: 40,
                                  child: TextFormField(
                                    onChanged: (val) =>
                                        _key.currentState?.validate(),
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    controller: _Name,
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return "أرجو منك تعبئه الحقل الفارغ ";
                                      else {
                                        return null;
                                      }
                                    },
                                    onSaved: (email) {},
                                    showCursor: true,
                                    cursorColor: const Color(0xff0da6c2),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: -10, horizontal: 1.0),
                                      filled: true, //<-- SEE HERE
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      fillColor: Colors.white,
                                      hintText: "عنوان الطلب",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: const Color(0xff0da6c2),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(22),
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xff0da6c2),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(22)),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(
                                            defaultPadding),
                                        child: Icon(
                                          Icons.person,
                                          color: const Color(0xff0da6c2),
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ////////////////////////////////////////////////
                              Center(
                                child: new Wrap(
                                    spacing: 5.0,
                                    runSpacing: 5.0,
                                    direction: Axis
                                        .vertical, // main axis (rows or columns)
                                    children: <Widget>[
                                      CupertinoButton(
                                        child: Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              right: 0,
                                              left: 0,
                                            ),
                                            child: Container(
                                              // padding:
                                              width: 360,
                                              height: 45,

                                              //   EdgeInsets.symmetric(horizontal: 120),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                border: Border.all(
                                                  color:
                                                      const Color(0xff0da6c2),
                                                  width: 1,
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              child: Flexible(
                                                child: Row(
                                                  textDirection:
                                                      ui.TextDirection.rtl,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .end, //change here don't //worked
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            child: Positioned(
                                                              left: 0,
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_circle_down_rounded,
                                                                // Icons.arrow_downward_outlined,
                                                                color: const Color(
                                                                    0xff0da6c2),
                                                                size: 16,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Container(
                                                              width: 180,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          120),
                                                              child: Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: GoogleFonts.poppins(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: const Color(
                                                                        0xff0da6c2)),
                                                                controller.text,
                                                                maxLines: 2,
                                                                // textAlign: TextAlign.left,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 80,
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 0,
                                                                        top:
                                                                            15),
                                                                // child: Padding(
                                                                //  padding: const EdgeInsets.only(
                                                                //      right: 12, top: 9, left: 9),
                                                                child:
                                                                    Container(
                                                                  //  padding: const EdgeInsets.only(right: 5),

                                                                  child: Row(
                                                                      textDirection: ui
                                                                          .TextDirection
                                                                          .rtl,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end, //change here don't //worked
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 0,
                                                                              bottom: 6),
                                                                          child: Image.asset(
                                                                              "assets/icons/family.png",
                                                                              width: 15,
                                                                              height: 15,
                                                                              color: const Color(0xff0da6c2)),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              4,
                                                                        ),
                                                                        Text(
                                                                          style: GoogleFonts.poppins(
                                                                              fontSize: 12,
                                                                              color: const Color(0xff0da6c2)),
                                                                          'نوع الطلب',
                                                                          maxLines:
                                                                              2,
                                                                          textAlign:
                                                                              TextAlign.right,
                                                                        ),
                                                                      ]),
                                                                ),
                                                              ),
                                                              // ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  height: 200.0,
                                                  color: Colors.white,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      CupertinoButton(
                                                        child: Text(
                                                          "إلغاء",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 17,
                                                            color: Color(
                                                                0xffA7A7A7),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                      Expanded(
                                                        child: CupertinoPicker(
                                                          scrollController:
                                                              scrollController,
                                                          looping: false,
                                                          itemExtent: 64,
                                                          backgroundColor:
                                                              Colors.white,
                                                          onSelectedItemChanged:
                                                              (index) {
                                                            print(index);
                                                            setState(() {
                                                              Index = index;
                                                              print(
                                                                  "[[[[[[[[[[[[[[[[[[[[[[[object]]]]]]]]]]]]]]]]]]]]]]]");
                                                              print(Index);

                                                              final item =
                                                                  Reason[Index];
                                                              Index = index;
                                                              print(item);
                                                              controller.text =
                                                                  item;
                                                              controller
                                                                ..text = item;
                                                              value = item;
                                                              if (Reason[
                                                                      Index] ==
                                                                  "أخرى") {
                                                                setState(() {
                                                                  Other = true;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  Other = false;
                                                                });
                                                              }
                                                            });
                                                          },
                                                          children: Reason.map(
                                                              (item) => Center(
                                                                      child:
                                                                          Text(
                                                                    item,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20),
                                                                  ))).toList(),
                                                        ),
                                                      ),
                                                      CupertinoButton(
                                                        child: Text("موافق",
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 17,
                                                                color: const Color(
                                                                    0xff0da6c2))),
                                                        onPressed: () {
                                                          // isshowadd = false;

                                                          scrollController =
                                                              FixedExtentScrollController(
                                                                  initialItem:
                                                                      _changedNumber);
                                                          //scrollController.dispose();
                                                          setState(() {
                                                            _selectedNumber =
                                                                _changedNumber;
                                                          });

                                                          Navigator.pop(
                                                              context);
                                                          /*  parentx.UpdateParent(
                                              widget.documentId,
                                              "RelativeRelation",
                                              value);*/
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                      ),
                                    ]),
                              ),
                              Form(
                                  key: formKeyDelegator,
                                  child: Column(children: [
                                    Column(children: [
                                      //HELLO
                                      Other
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: defaultPadding),
                                              child: Directionality(
                                                textDirection:
                                                    ui.TextDirection.rtl,
                                                child: SizedBox(
                                                  // <-- SEE HERE
                                                  width: 360,
                                                  child: TextFormField(
                                                    //   onChanged: (val) => _key.currentState?.validate(),
                                                    keyboardType:
                                                        TextInputType.name,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    controller: _Name,
                                                    validator: (value) {
                                                      if (value!.isEmpty)
                                                        return "أرجو منك تعبئه الحقل الفارغ ";
                                                      else {
                                                        return null;
                                                      }
                                                    },
                                                    onSaved: (email) {},
                                                    showCursor: true,
                                                    cursorColor:
                                                        const Color(0xff0da6c2),
                                                    decoration: InputDecoration(
                                                      filled:
                                                          true, //<-- SEE HERE
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.red,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(22),
                                                      ),
                                                      fillColor: Colors.white,
                                                      hintText:
                                                          "ماهو نوع الطلب",
                                                      hintStyle:
                                                          const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: const Color(
                                                                0xff0da6c2),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(22),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: const Color(
                                                                  0xff0da6c2),
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      22)),
                                                      prefixIcon: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .all(
                                                                defaultPadding),
                                                        child: Icon(
                                                          Icons.person,
                                                          color: const Color(
                                                              0xff0da6c2),
                                                          size: 22,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              // padding:
                                              width: 360,
                                              height: 45,

                                              //   EdgeInsets.symmetric(horizontal: 120),
                                              decoration: BoxDecoration(
                                                color: ui.Color.fromARGB(
                                                    255, 226, 221, 221),
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 210, 208, 208),
                                                  width: 1,
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              child: Flexible(
                                                child: Row(
                                                  textDirection:
                                                      ui.TextDirection.rtl,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .end, //change here don't //worked
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Row(
                                                        children: <Widget>[
                                                          SizedBox(
                                                            width: 220,
                                                          ),
                                                          SizedBox(
                                                            width: 60,
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 0,
                                                                        top:
                                                                            15),
                                                                // child: Padding(
                                                                //  padding: const EdgeInsets.only(
                                                                //      right: 12, top: 9, left: 9),
                                                                child:
                                                                    Container(
                                                                  //  padding: const EdgeInsets.only(right: 5),

                                                                  child: Row(
                                                                      textDirection: ui
                                                                          .TextDirection
                                                                          .rtl,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end, //change here don't //worked
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 0,
                                                                              bottom: 6),
                                                                          child: Image.asset(
                                                                              "assets/icons/family.png",
                                                                              width: 15,
                                                                              height: 15,
                                                                              color: Colors.grey),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              4,
                                                                        ),
                                                                        Text(
                                                                          style: GoogleFonts.poppins(
                                                                              fontSize: 12,
                                                                              color: Colors.grey),
                                                                          'نوع الطلب',
                                                                          maxLines:
                                                                              2,
                                                                          textAlign:
                                                                              TextAlign.right,
                                                                        ),
                                                                      ]),
                                                                ),
                                                              ),
                                                              // ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Form(
                                        key: _key2,
                                        child: Directionality(
                                            textDirection: ui.TextDirection.rtl,
                                            child: SizedBox(
                                              // <-- SEE HERE
                                              width: 360,
                                              child: TextFormField(
                                                onChanged: (val) {
                                                  ////////////////////////
                                                  ///
                                                  formKeyDelegator.currentState
                                                      ?.validate();

                                                  for (var i = 0;
                                                      i < UsernameList.length;
                                                      i++) {
                                                    if (val ==
                                                        UsernameList[i]) {
                                                      /* print("the delegator exsits");
                                            print(DelegatorList[i]);
                                            print(val);*/
                                                      setState(() {
                                                        isWrong = true;
                                                        isCorrect = true;
                                                      });

                                                      formKeyDelegator
                                                          .currentState
                                                          ?.validate();
                                                      /*  print("isWrong:");
                                            print(isWrong);
                                            print("isCorrect:");
                                            print(isCorrect);*/
                                                      break;
                                                    } else {
                                                      ///print("Heeree");
                                                      setState(() {
                                                        isWrong = false;
                                                        isCorrect = true;
                                                      });
                                                    }
                                                  }

                                                  if (isWrong) {
                                                    // print("ssssssssssssssssssssssss");
                                                    // print(Delegatorsername.text);
                                                    FirebaseFirestore.instance
                                                        .collection("Student")
                                                        .get()
                                                        .then((snapshot) =>
                                                            snapshot.docs
                                                                .forEach(
                                                                    (document) {
                                                              if (StudentUsername
                                                                      .text ==
                                                                  document[
                                                                      "UserName"]) {
                                                                StudentName
                                                                  ..text =
                                                                      document[
                                                                          "Name"];
                                                                // print(
                                                                //     "++++++++++++++++++++++++++++++++++");
                                                                // print(str);
                                                              }
                                                            }));
                                                  }

                                                  // اذا فالد بتصير بترو

                                                  /* print("wwwwwwwwwwwwwwwwwwww");
                                        print(isWrong);
                                        print(isCorrect);*/
                                                },
                                                controller: StudentUsername,
                                                //  controller: parentUserName..text = parentx.PUserName,
                                                //to take text from user input
                                                textAlign: TextAlign.right,
                                                decoration: InputDecoration(
                                                  suffixIcon: isCorrect
                                                      ? Align(
                                                          widthFactor: 1.0,
                                                          heightFactor: 1.0,
                                                          child: isWrong
                                                              ? Icon(
                                                                  Icons.check,
                                                                  size: 18,
                                                                  color: const Color(
                                                                      0xff42c98d),
                                                                )
                                                              : Icon(
                                                                  Icons.close,
                                                                  size: 18,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          225,
                                                                          80,
                                                                          61),
                                                                ),
                                                        )
                                                      : Text(""),
                                                  filled: true, //<-- SEE HERE
                                                  fillColor: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  hintText:
                                                      " أسم المستخدم لطالب",
                                                  hintStyle: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: const Color(
                                                            0xff0da6c2),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: const Color(
                                                                  0xff0da6c2),
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      22)),
                                                  prefixIcon: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            defaultPadding),
                                                    child: Icon(
                                                      Icons.person,
                                                      color: const Color(
                                                          0xff0da6c2),
                                                      size: 22,
                                                    ),
                                                  ),
                                                ),

                                                showCursor: true,
                                                cursorColor:
                                                    const Color(0xff0da6c2),

                                                validator: (value) {
                                                  if (value!.isEmpty)
                                                    return "أرجو منك تعبئه الحقل الفارغ ";
                                                  else if (isWrong == false) {
                                                    return " اسم المستخدم لطالب غير صحيح";
                                                  } else {}
                                                },
                                              ),
                                            )),
                                      ),
                                    ])
                                  ])),
                              Form(
                                key: _key3,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: defaultPadding),
                                    child: Directionality(
                                        textDirection: ui.TextDirection.rtl,
                                        child: SizedBox(
                                          // <-- SEE HERE
                                          width: 360,
                                          child: TextFormField(
                                              minLines: 3,
                                              maxLines: 5,
                                              keyboardType: TextInputType
                                                  .multiline, // user keyboard will have a button to move cursor to next line
                                              controller: Content,
                                              onChanged: (val) =>
                                                  _key.currentState?.validate(),
                                              textInputAction:
                                                  TextInputAction.next,
                                              validator: (value) {
                                                if (value!.isEmpty)
                                                  return "أرجو منك تعبئه الحقل الفارغ ";
                                                else {
                                                  return null;
                                                }
                                              },
                                              onSaved: (email) {},
                                              showCursor: true,
                                              cursorColor:
                                                  const Color(0xff0da6c2),
                                              decoration: InputDecoration(
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(22),
                                                ),
                                                // errorText: "ssssssssssss",
                                                filled: true, //<-- SEE HERE
                                                fillColor: Colors.white,
                                                hintText: "محتوى الطلب",
                                                hintStyle: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: const Color(
                                                          0xff0da6c2),
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(22),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: const Color(
                                                                0xff0da6c2),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(22)),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      defaultPadding),
                                                  child: Icon(
                                                    Icons.message,
                                                    color:
                                                        const Color(0xff0da6c2),
                                                    size: 22,
                                                  ),
                                                ),
                                              )
                                              // allow user to enter 5 line in textfield

                                              ),
                                        ))),
                              ),

                              const SizedBox(height: defaultPadding / 2),
                              const SizedBox(height: defaultPadding),
                              SizedBox(
                                // <-- SEE HERE
                                width: 380,
                                child: Hero(
                                  tag: "login_btn",
                                  child: Center(
                                    child: Container(
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              // const Color(0xff57d77a),
                                              //  const Color(0xff42c98d),
                                              const Color(0xff0da6c2),
                                              const Color(0xff0da6c2),

                                              //add more colors
                                            ]),
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Color.fromRGBO(0, 0, 0,
                                                      0.57), //shadow for button
                                                  blurRadius:
                                                      5) //blur radius of shadow
                                            ]),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            onSurface: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            //make color or elevated button transparent
                                          ),
                                          onPressed: () {
                                            if (_key.currentState != null &&
                                                _key.currentState!.validate() &&
                                                _key2.currentState != null &&
                                                _key2.currentState!
                                                    .validate() &&
                                                _key3.currentState != null &&
                                                _key3.currentState!
                                                    .validate()) {
                                              showCupertinoDialog(
                                                  context: context,
                                                  builder: CreateDialog3);
                                            }
                                            /* Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => Nav(
                          TabValue: 0,
                          documentId: "",
                        ),
                      ));*/
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 18,
                                              bottom: 18,
                                            ),
                                            child: Text(
                                              "ارسال  ",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              /* ElevatedButton(
            onPressed: () {},
            child: Text("تسجيل الدخول "),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),*/
                              const SizedBox(height: defaultPadding / 2),
                              const SizedBox(height: defaultPadding),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CreateDialog3(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text(' طلب تفويض',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
      content: Text('هل انت متأكد انك تريد تفويض',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              DateTime today = DateTime.now();
              String dateStr =
                  "${today.year}-${today.month}-${today.day} ${today.hour}:${today.minute}";
              // print(dateStr);

              var Type = value;
              if (Type == "أخرى") {
                Type = OtherController.text;
              }
              ReqParent2.AddRequestParent(_Name.text, Type, Content.text,
                  ParentID, StudentUsername.text, dateStr);
              // Navigator.push(context,
              //     CupertinoPageRoute(builder: (context) => ListDelegator()));
              //parentx.DeleteParent(CurrentID);
              Navigator.pop(context);
            },
            child: const Text("موافق",
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 24, 24),
                    fontWeight: FontWeight.bold))),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('إلغاء'),
        ),
      ],
    );
  }
}

Widget CreateDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    title: Text("تسجيل حساب",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(31, 31, 31, 1),
            fontWeight: FontWeight.bold)),
    content: Text(
      "تم تسجبل حسابك بنجاح بإمكانك الدخول لحسابك ",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14),
    ),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("موافق",
              style: TextStyle(
                  color: const Color(0xff57d77a),
                  fontWeight: FontWeight.bold))),
    ],
  );
}
