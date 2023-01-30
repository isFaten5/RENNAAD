import 'package:circlight/Pages/RequestParent.dart';
import 'package:flutter/cupertino.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SssaaWidget extends StatefulWidget {
  const SssaaWidget({Key? key}) : super(key: key);

  @override
  _SssaaWidgetState createState() => _SssaaWidgetState();
}

class _SssaaWidgetState extends State<SssaaWidget> {
  TextEditingController? emailAddressController1;
  TextEditingController? emailAddressController2;
  TextEditingController? emailAddressController3;
  TextEditingController OtherController = TextEditingController();
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController1 = TextEditingController();
    emailAddressController2 = TextEditingController();
    emailAddressController3 = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    emailAddressController1?.dispose();
    emailAddressController2?.dispose();
    emailAddressController3?.dispose();
    super.dispose();
  }

  final _key = GlobalKey<FormState>();
  RequestParent ReqParent2 = new RequestParent(
      Type: "", Content: "", Date: "", ParentID: "", Title: "");
  @override
  Widget build(BuildContext context) {
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
                      height: 210,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/formbackground.png',
                            width: double.infinity,
                            height: 230,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.06, 0.74),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                              child: Text(
                                'إنشاء طلب ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.86, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                            child: Text(
                              'Upcoming Lessons',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Form(
                      key: _key,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  17, 17, 17, 17),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return "أرجو منك تعبئه الحقل الفارغ ";
                                  else {
                                    return null;
                                  }
                                },
                                controller: emailAddressController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: "عنوان الطلب",
                                  labelStyle:
                                      FlutterFlowTheme.of(context).subtitle2,
                                  hintText: "أدخل عنوان الطلب",
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDEE1E6),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDEE1E6),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context).subtitle1,
                                maxLines: null,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  17, 17, 17, 17),
                              child: TextFormField(
                                controller: emailAddressController2,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).subtitle2,
                                  hintText: 'Enter your email here...',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDEE1E6),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDEE1E6),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context).subtitle1,
                                maxLines: null,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  17, 17, 17, 17),
                              child: TextFormField(
                                controller: emailAddressController3,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).subtitle2,
                                  hintText: 'Enter your email here...',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDEE1E6),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDEE1E6),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context).subtitle1,
                                maxLines: null,
                              ),
                            ),
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
                                            _key.currentState!.validate()) {
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
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Button',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
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

              var Type = "value";
              if (Type == "أخرى") {
                Type = OtherController.text;
              }
              /*   ReqParent2.AddRequestParent(_Name.text, Type, Content.text,
                  ParentID, StudentUsername.text, dateStr);*/
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
