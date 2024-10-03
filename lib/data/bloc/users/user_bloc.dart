// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:one_chat_app/repository/screens/auth/login_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../firebase/firebase_provider.dart';
// import 'user_events.dart';
// import 'user_states.dart';

// class UserBloc extends Bloc<UserEvents, UserStates> {
//   FirebaseProvider firebaseProvider;
//   BuildContext context;

//   UserBloc({required this.firebaseProvider, required this.context})
//       : super(UserInitialState()) {
//     on<ContactsUserEvent>((event, emit) async {
//       var userId;

//       Future<void> getPrefs() async {
//         var prefs = await SharedPreferences.getInstance();
//         userId = prefs.getString(LoginPageState.loginPrefsKey);

//         log("prefs userId >>> $LoginPageState.LOGIN_PREFS_KEY");
//       }

//       try {
//         emit(UserLoadingState());

//         //   await FirebaseFirestore.instance
//         // .collection("users").get();

//         emit(UserLoadedState(
//             collectionList: await FirebaseFirestore.instance
//                 .collection("users")
//                 .where('uid', isNotEqualTo: userId)
//                 .get()));
//         log("users collection hit check now");
//       } catch (e) {
//         emit(UserErrorState(errorMsg: e.toString()));
//         log("error contacts fetech From Firebase $e.toString()");
//       }
//     });
//   }

//   //   );
//   // }
// }
