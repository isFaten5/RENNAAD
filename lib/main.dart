import 'package:circlight/Pages/Announcement.dart';
import 'package:circlight/Pages/CreateParent.dart';
import 'package:circlight/Pages/SssaaWidget.dart';
import 'package:circlight/Pages/constants.dart';

import 'package:circlight/Pages/displayParent.dart';
import 'package:circlight/Pages/displayStudent.dart';
import 'package:circlight/Pages/emails.dart';
import 'package:circlight/Screens/Welcome/welcome_screen.dart';
import 'package:circlight/page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circlight/Pages/firebase_options.dart';
import 'package:circlight/Pages/Nav.dart';

import 'Pages/CreateDelegator.dart';
import 'Pages/CreateStudent.dart';

import 'Pages/DelegatorHome.dart';
import 'Pages/DelegatorList.dart';
import 'Pages/DelegatorPending.dart';
import 'Pages/DelegatorStudents.dart';
import 'Pages/GenaralSearch.dart';
import 'Pages/ListDelegator.dart';
import 'Pages/ListRequest.dart';
import 'Pages/NavDelegator.dart';
import 'Pages/NavParent.dart';

import 'Pages/base_screen.dart';
import 'Pages/edit5.dart';
import 'Pages/editStudent.dart';
import 'Pages/sign.dart';

import 'Pages/DelegatorList.dart';
import 'Screens/Signup/RequestForm.dart';
import 'Screens/Signup/components/RequestParent.dart';
import 'flutter_flow/flutter_flow_util.dart';

Future main() async {
//start of firebase connection
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LoginUiApp());

  //end firebase connection
}

class LoginUiApp extends StatelessWidget {
  Color _primaryColor = const Color(0xff0da6c2);
  Color _accentColor = const Color(0xff57d77a);

  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Login UI',
        title: 'Circlight',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: _primaryColor,
          accentColor: _accentColor,
          primarySwatch: Colors.grey,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            bodyLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            displayMedium: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        home: //DelegatorHome(),
            // ListDelegator()
            //  DelegatorPending()
            //]  DelegatorStudent()
            // WelcomeScreen(),
            /* HomePage2(
          TabValue: 0,
        )*/
            //    Announcement()
            SssaaWidget()
        // ParentReq()
        //     RequestForm()
        //  NavDel(TabValue: 1),
        //    Delegatordisplay()
        // DelegatorPending()
        /*  NavParent(
        TabValue: 0,
      ),*/
        //  GeneralSearch(),
        //  CreateDelegator()
        // Paretdisplay()
        /*  NavDel(
          TabValue: 0,
        )*/
        //   DelegatorStudent()
        /*    NavParent(
          TabValue: 0,
        )*/
        //ListRequest()
        // Createparent5(index: 0),
        // Delegatordisplay(),
        );
  }
}
