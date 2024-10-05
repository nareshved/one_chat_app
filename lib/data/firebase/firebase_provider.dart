import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:one_chat_app/repository/screens/auth/login_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/user_model.dart';

class FirebaseProvider {
  static final fireBaseAuth = FirebaseAuth.instance;
  static final fireBaseFireStore = FirebaseFirestore.instance;
//  static final firebaseAuth = FirebaseAuth.instance;

  static const String collectionUser = "users";
  static const String collectionChat = "chats";
  static const String collectionMSG = "messages";

  //static final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> createUser(
      {required UserModel mUser, required String mPass}) async {
    try {
      UserCredential credential = await fireBaseAuth
          .createUserWithEmailAndPassword(email: mUser.email!, password: mPass);

      /// create user in firestore
      if (credential.user != null) {
        fireBaseFireStore
            .collection(collectionUser)
            .doc(credential.user!.uid)
            .set(mUser.toDoc())
            .then((value) {})
            .onError((error, stackTrace) {
          log("Error: $error");
          throw Exception("Error: $error");
        });
      }
    } on FirebaseException catch (e) {
      log("Error: $e");
      throw Exception("Error: $e");
    }
  }

  Future<void> authenticateUser(
      {required mEmail,
      required String mPass,
      required BuildContext context}) async {
    try {
      final UserCredential credential = await fireBaseAuth
          .signInWithEmailAndPassword(email: mEmail, password: mPass);

      if (credential.user != null) {
        var prefs = await SharedPreferences.getInstance();
        prefs.setString(LoginPageState.loginPrefsKey, credential.user!.uid);
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const HomeChatsPage(),
        //     ));
        //
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text("SuccessFully Logged In")));

        /// const remove
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("user not logged in\n please try again!!")));
      }
    } on FirebaseException catch (myErrors) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(myErrors.code)));
    } catch (e) {
      log("user login failed error $e.toString()");
    }
  }

  /// fetch all contacts from firebase
  static Future<QuerySnapshot<Map<String, dynamic>>>
      contactsFromFirebase() async {
    return fireBaseFireStore.collection(collectionUser).get();
  }

// my functions

//   Future<void> createUser(String email, String mPassord) async {

//   try {

//     final UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword
//     (email: email, password: mPassord);
//     log("found user is null in firebase ");

//    if(credential.user != null ) {

//      fireBaseFireStore.collection(userCollection)
//     .doc(credential.user!.uid).set(user!.toDoc());

//     /// second collection optional

//     fireBaseFireStore.collection(collectionPasswords).
//     doc(credential.user!.uid).set({
//       "name" : user!.name,
//       "password" : user!.password
//     });
//      log("found user  firebase provider");

//   }

//   else {
//     log("found user is null in firebase provider");
//   }

//   }

//   on FirebaseAuthException catch (e) {
//   if (e.code == 'weak-password') {
//     log('The password provided is too weak.');

//     PrefsUser().showmBar('The password provided is too weak.');

//   }

//   else if (e.code == 'email-already-in-use') {
//     log('The account already exists for that email.');

//     PrefsUser().showmBar('The account already exists for that email.');

//   }

// } catch (e) {
//   log("user not created error $e.toString()");

// }
//   }

  // Future<void> loginUser ({required String email, required String mPassord})async {

  //   try{

  //     final  UserCredential credential =
  //     await firebaseAuth.signInWithEmailAndPassword(email: email, password: mPassord);

  //   if(credential.user != null){

  //     PrefsUser.prefsUserUidString(value: credential.user!.uid);
  //         // refs UID Saved
  //     log( PrefsUser.prefsUserUidString(value: credential.user!.uid).toString());    // refs UID Saved

  //     PrefsUser.prefsSetBool(value: true);

  //   }
  //   } catch(e){

  //     log("user login failed error $e.toString()");
  //   }
  // }

  // static userLogOut() async {
  //   await fireBaseAuth.signOut();

  //   PrefsUser().showmBar("You are signOut");

  //   log("user signOut from firebase");

  //   PrefsUser.prefsSetlogOut(value: "");

  //   log("user signOut from prefs");
  // }

  // static Future<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
  //   return fireBaseFireStore.collection(COLLECTION_USER).get();
  // }

  // static String getChatId(String fromId, String toId) {
  //   log("$fromId, $toId");
  //   if (fromId.hashCode <= toId.hashCode) {
  //     return "${fromId}_$toId";
  //   } else {
  //     return "${toId}_$fromId";
  //   }
  // }

  // static void sendMessage(
  //     {required String msg,
  //     required String toId,
  //     required String userId}) async {
  //   var currTime = DateTime.now().millisecondsSinceEpoch;
  //   var chatId = getChatId(userId, toId);
  //   log("$userId, $toId");
  //   log(chatId);

  //   var newMsg = MessageModel(
  //       msgId: currTime.toString(),
  //       msg: msg,
  //       sentAt: currTime.toString(),
  //       fromId: userId,
  //       toId: toId);

  //   fireBaseFireStore
  //       .collection(COLLECTION_CHAT)
  //       .doc(chatId)
  //       .collection(COLLECTION_MSG)
  //       .doc(currTime.toString())
  //       .set(newMsg.toDoc());
  // }

  // static void sendImageMsg(
  //     {required String imgUrl,
  //     required String toId,
  //     String imgMsg = "",
  //     required String userId}) async {
  //   var currTime = DateTime.now().millisecondsSinceEpoch;
  //   var chatId = getChatId(userId, toId);

  //   var newImgMsg = MessageModel(
  //       msgId: currTime.toString(),
  //       msg: imgMsg,
  //       sentAt: currTime.toString(),
  //       fromId: userId,
  //       msgType: 1,
  //       imgUrl: imgUrl,
  //       toId: toId);

  //   fireBaseFireStore
  //       .collection(COLLECTION_CHAT)
  //       .doc(chatId)
  //       .collection(COLLECTION_MSG)
  //       .doc(currTime.toString())
  //       .set(newImgMsg.toDoc());
  // }

  // static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMsg(
  //     {required String userId, required String toId}) {
  //   var chatId = getChatId(userId, toId);
  //   log("getMessage : $userId, $toId");
  //   log("getMessage : $chatId");

  //   return fireBaseFireStore
  //       .collection(COLLECTION_CHAT)
  //       .doc(chatId)
  //       .collection(COLLECTION_MSG)
  //       .orderBy("sentAt", descending: true)
  //       .snapshots();
  // }

  // static void updateReadStatus(
  //     {required String mId, required String userId, required String toId}) {
  //   var currTime = DateTime.now().millisecondsSinceEpoch;
  //   var chatId = getChatId(userId, toId);

  //   fireBaseFireStore
  //       .collection(COLLECTION_CHAT)
  //       .doc(chatId)
  //       .collection(COLLECTION_MSG)
  //       .doc(mId)
  //       .update({"readAt": currTime.toString()});
  // }

  // static Stream<QuerySnapshot<Map<String, dynamic>>> getUnreadCount(
  //     {required String userId, required String toId}) {
  //   var chatId = getChatId(userId, toId);

  //   return fireBaseFireStore
  //       .collection(COLLECTION_CHAT)
  //       .doc(chatId)
  //       .collection(COLLECTION_MSG)
  //       .where("readAt", isEqualTo: "")
  //       .where("fromId", isEqualTo: toId)
  //       .snapshots();
  // }

  // static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMsg({required String userId, required String toId}){
  //   var chatId = getChatId(userId, toId);

  //   return fireBaseFireStore
  //       .collection(COLLECTION_CHAT)
  //       .doc(chatId)
  //       .collection(COLLECTION_MSG)
  //       .orderBy("sentAt", descending: true)
  //       .limit(1)
  //       .snapshots();

  // }
}
