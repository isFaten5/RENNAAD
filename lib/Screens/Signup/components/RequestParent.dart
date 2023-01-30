import 'package:circlight/Pages/Nav.dart';
import 'package:circlight/Pages/RequestParent.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
//import 'Nav.dart';
import 'dart:ui' as ui;

class ParentReq extends StatefulWidget {
  const ParentReq({
    Key? key,
  }) : super(key: key);

  @override
  State<ParentReq> createState() => _ParentReq();
}

class _ParentReq extends State<ParentReq> with TickerProviderStateMixin {
  //defining a lists
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

  //signup method
  Future _signup() async {
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailContoller.text, password: _passwordController.text);
      //}

      await FirebaseFirestore.instance.collection("Delegator").add({
        "Email": _emailContoller.text,
        "UserName": _UsernamelContoller.text,
        "Password": _passwordController.text,
      });
      await showCupertinoDialog(context: context, builder: CreateDialog);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    /*showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("تم التسجيل بنجاح"),
              content: Text("تم تسجبل حسابك بإمكانك الدخول لحسابك "),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("موافق "),
                )
              ],
            ));*/

    Navigator.of(context).pop();
    /* on FirebaseAuthException catch (e) {
      _handlesignupError(e);
      setState(() {
        loading = false;
      });
    }*/
  }

  /*void _handlesignupError(FirebaseAuthException e) {
    String messagetodisplay;
    switch (e.code) {
      case "email-already-in-use":
        messagetodisplay = "البريد الالكتروني مستخدم مسبقا";
        break;
      case "invalid-email":
        messagetodisplay = "البريد الالكتروني المدخل غير صحيح";
        break;

      case "operation-not-allowed":
        messagetodisplay = "هذه العمليه غير مسموح بها ";
      
        break

    }
  }*/
//conntrollers
  final _key = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();
  final _key3 = GlobalKey<FormState>();
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _UsernamelContoller = TextEditingController();
  TextEditingController _ConformpasswordController = TextEditingController();
  TextEditingController _ID = TextEditingController();
  TextEditingController _Phonenumber = TextEditingController();
  TextEditingController _Name = TextEditingController();
  TextEditingController _Name2 = TextEditingController();
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
    return Form(
      key: _key,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                onChanged: (val) => _key.currentState?.validate(),
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
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.white,
                  hintText: "عنوان الطلب",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: const Color(0xff0da6c2), width: 1),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: const Color(0xff0da6c2), width: 1),
                      borderRadius: BorderRadius.circular(22)),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
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
                direction: Axis.vertical, // main axis (rows or columns)
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
                          width: 310,
                          height: 45,

                          //   EdgeInsets.symmetric(horizontal: 120),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: const Color(0xff0da6c2),
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Flexible(
                            child: Row(
                              textDirection: ui.TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment
                                  .end, //change here don't //worked
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Positioned(
                                          left: 0,
                                          child: Icon(
                                            Icons.arrow_circle_down_rounded,
                                            // Icons.arrow_downward_outlined,
                                            color: const Color(0xff0da6c2),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          width: 120,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(right: 50),
                                          child: Text(
                                            textAlign: TextAlign.end,
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff0da6c2)),
                                            controller.text,
                                            maxLines: 2,
                                            // textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70,
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.centerRight,
                                            padding: EdgeInsets.only(
                                                left: 0, top: 15),
                                            // child: Padding(
                                            //  padding: const EdgeInsets.only(
                                            //      right: 12, top: 9, left: 9),
                                            child: Container(
                                              //  padding: const EdgeInsets.only(right: 5),

                                              child: Row(
                                                  textDirection:
                                                      ui.TextDirection.rtl,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .end, //change here don't //worked
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 0,
                                                              bottom: 6),
                                                      child: Image.asset(
                                                          "assets/icons/family.png",
                                                          width: 15,
                                                          height: 15,
                                                          color: const Color(
                                                              0xff0da6c2)),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 12,
                                                          color: const Color(
                                                              0xff0da6c2)),
                                                      'نوع الطلب',
                                                      maxLines: 2,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CupertinoButton(
                                    child: Text(
                                      "إلغاء",
                                      style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        color: Color(0xffA7A7A7),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Expanded(
                                    child: CupertinoPicker(
                                      scrollController: scrollController,
                                      looping: false,
                                      itemExtent: 64,
                                      backgroundColor: Colors.white,
                                      onSelectedItemChanged: (index) {
                                        print(index);
                                        setState(() {
                                          Index = index;
                                          print(
                                              "[[[[[[[[[[[[[[[[[[[[[[[object]]]]]]]]]]]]]]]]]]]]]]]");
                                          print(Index);

                                          final item = Reason[Index];
                                          Index = index;
                                          print(item);
                                          controller.text = item;
                                          controller..text = item;
                                          value = item;
                                          if (Reason[Index] == "أخرى") {
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
                                      children: Reason.map((item) => Center(
                                              child: Text(
                                            item,
                                            style: TextStyle(fontSize: 20),
                                          ))).toList(),
                                    ),
                                  ),
                                  CupertinoButton(
                                    child: Text("موافق",
                                        style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            color: const Color(0xff0da6c2))),
                                    onPressed: () {
                                      // isshowadd = false;

                                      scrollController =
                                          FixedExtentScrollController(
                                              initialItem: _changedNumber);
                                      //scrollController.dispose();
                                      setState(() {
                                        _selectedNumber = _changedNumber;
                                      });

                                      Navigator.pop(context);
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
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              //   onChanged: (val) => _key.currentState?.validate(),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              controller: _Name2,
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
                                filled: true, //<-- SEE HERE
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                fillColor: Colors.white,
                                hintText: "ماهو نوع الطلب",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color(0xff0da6c2), width: 1),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color(0xff0da6c2),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(22)),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(defaultPadding),
                                  child: Icon(
                                    Icons.person,
                                    color: const Color(0xff0da6c2),
                                    size: 22,
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
                            color: ui.Color.fromARGB(255, 226, 221, 221),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Color.fromARGB(255, 210, 208, 208),
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Flexible(
                            child: Row(
                              textDirection: ui.TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment
                                  .end, //change here don't //worked
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 200,
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.centerRight,
                                            padding: EdgeInsets.only(
                                                left: 0, top: 15),
                                            // child: Padding(
                                            //  padding: const EdgeInsets.only(
                                            //      right: 12, top: 9, left: 9),
                                            child: Container(
                                              //  padding: const EdgeInsets.only(right: 5),

                                              child: Row(
                                                  textDirection:
                                                      ui.TextDirection.rtl,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .end, //change here don't //worked
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 0,
                                                              bottom: 6),
                                                      child: Image.asset(
                                                          "assets/icons/family.png",
                                                          width: 15,
                                                          height: 15,
                                                          color: Colors.grey),
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.grey),
                                                      'نوع الطلب',
                                                      maxLines: 2,
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
                    height: 15,
                  ),
                  Form(
                    key: _key2,
                    child: Directionality(
                      textDirection: ui.TextDirection.rtl,
                      child: TextFormField(
                        onChanged: (val) {
                          ////////////////////////
                          ///
                          formKeyDelegator.currentState?.validate();

                          for (var i = 0; i < UsernameList.length; i++) {
                            if (val == UsernameList[i]) {
                              /* print("the delegator exsits");
                                            print(DelegatorList[i]);
                                            print(val);*/
                              setState(() {
                                isWrong = true;
                                isCorrect = true;
                              });

                              formKeyDelegator.currentState?.validate();
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
                                    snapshot.docs.forEach((document) {
                                      if (StudentUsername.text ==
                                          document["UserName"]) {
                                        StudentName..text = document["Name"];
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
                                          color: const Color(0xff42c98d),
                                        )
                                      : Icon(
                                          Icons.close,
                                          size: 18,
                                          color:
                                              Color.fromARGB(255, 225, 80, 61),
                                        ),
                                )
                              : Text(""),
                          filled: true, //<-- SEE HERE
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          hintText: " أسم المستخدم لطالب",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xff0da6c2), width: 1),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color(0xff0da6c2), width: 1),
                              borderRadius: BorderRadius.circular(22)),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Icon(
                              Icons.person,
                              color: const Color(0xff0da6c2),
                              size: 22,
                            ),
                          ),
                        ),

                        showCursor: true,
                        cursorColor: const Color(0xff0da6c2),

                        validator: (value) {
                          if (value!.isEmpty)
                            return "أرجو منك تعبئه الحقل الفارغ ";
                          else if (isWrong == false) {
                            return " اسم المستخدم لطالب غير صحيح";
                          } else {}
                        },
                      ),
                    ),
                  ),
                ])
              ])),
          Form(
            key: _key3,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                      minLines: 3,
                      maxLines: 5,
                      keyboardType: TextInputType
                          .multiline, // user keyboard will have a button to move cursor to next line
                      controller: Content,
                      onChanged: (val) => _key.currentState?.validate(),
                      textInputAction: TextInputAction.next,
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
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        // errorText: "ssssssssssss",
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.white,
                        hintText: "محتوى الطلب",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xff0da6c2), width: 1),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xff0da6c2), width: 1),
                            borderRadius: BorderRadius.circular(22)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Icon(
                            Icons.message,
                            color: const Color(0xff0da6c2),
                            size: 22,
                          ),
                        ),
                      )
                      // allow user to enter 5 line in textfield

                      ),
                )),
          ),

          const SizedBox(height: defaultPadding / 2),
          const SizedBox(height: defaultPadding),
          Hero(
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
                      if (_key.currentState != null &&
                          _key.currentState!.validate() &&
                          _key2.currentState != null &&
                          _key2.currentState!.validate() &&
                          _key3.currentState != null &&
                          _key3.currentState!.validate()) {
                        showCupertinoDialog(
                            context: context, builder: CreateDialog3);
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
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          )
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
        ],
      ),
    );
  }
  /*void signInUser() async {
    dynamic authResult =
        await _auth.loginUser(_emailContoller.text, _passwordController.text);
    if (authResult == null) {
      print('Sign in error. could not be able to login');
    } else {
      _emailContoller.clear();
      _passwordController.clear();
      //Navigator.pushNamed(context, '/dashboard');
    }
  }*/

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
