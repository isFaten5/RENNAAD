import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class RequestParent {
  String Title = " "; //

  String Type = " "; //
  String Content = ""; //
  String ParentID = " ";

  String SUsername = " "; //
  String Date = " "; //
//

  RequestParent(
      {required this.Title,
      required this.Type,
      required this.Content,
      required this.ParentID,
      required this.Date});
//to update student

// to delete student

// to add student
  AddRequestParent(Title, Type, Content, ParentID, SUsername, Date) async {
    final ParentRequest = FirebaseFirestore.instance;
    await ParentRequest.collection("RequestParent").add({
      "Title": Title,
      "Type": Type,
      'Content': Content,
      'ParentID': ParentID,
      "StudentUserName": SUsername,
      "Date": Date
    });
  }

  DeleteRequestsParent(DocId) async {
    CollectionReference Parents =
        FirebaseFirestore.instance.collection("Requests");
    await Parents.doc(DocId).delete();
  }

  UpdateRequestParent(DocId, Field, Updated) async {
    CollectionReference Request =
        FirebaseFirestore.instance.collection("Requests");

    switch (Field) {
      case 'DUserName':
        await Request.doc(DocId).update({
          'DUserName': Updated,
        });
        break;

      case "DelegatorName":
        await Request.doc(DocId).update({
          'DelegatorName': Updated,
        });
        break;
      case "isAccepted":
        await Request.doc(DocId).update({
          'isAccepted': Updated,
        });
        break;
      case "IsActive":
        await Request.doc(DocId).update({
          'IsActive': Updated,
        });
        break;
      case "StudentID":
        await Request.doc(DocId).update({
          'StudentID': Updated,
        });
        break;
      case "DelegatorActive":
        await Request.doc(DocId).update({
          'DelegatorActive': Updated,
        });
        break;
      case "Date":
        await Request.doc(DocId).update({
          'Date': Updated,
        });
        break;
    }
  }
} //END OF CLASS
