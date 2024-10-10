import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:one_chat_app/data/firebase/firebase_provider.dart';
import 'package:one_chat_app/domain/models/user_model.dart';
import 'package:one_chat_app/repository/screens/auth/login_page.dart';
import 'package:one_chat_app/repository/screens/pages/chat_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  var userId;

  Future<void> getUserIdPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(LoginPageState.loginPrefsKey);
  }

  @override
  Widget build(BuildContext context) {
    getUserIdPrefs();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: FirebaseProvider.getAllContactsFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            //   } else if (!snapshot.hasData || snapshot.data == null) {
            //     // Handle the case when there's no data
            //     return const Center(
            //       child: Text('No Contacts Found'),
            //     );
          }

          List<UserModel> arrUsers = [];

          for (QueryDocumentSnapshot<Map<String, dynamic>> eachDoc
              in snapshot.data!.docs) {
            var eachUser = UserModel.fromDoc(eachDoc.data());

            if (eachDoc.id != userId) {
              arrUsers.add(eachUser);
            }
          }

          return snapshot.data!.docs.isNotEmpty
              ? ListView.builder(
                  itemCount: arrUsers.length,
                  itemBuilder: (context, index) {
                    var eachContactId = snapshot.data!.docs[index].id;
                    return ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              toId: eachContactId,
                            ),
                          )),
                      title: Text(arrUsers[index].name!),
                      subtitle: Text(arrUsers[index].email!),
                    );
                  },
                )
              : const Center(
                  child: Text('No Contacts Found'),
                );
        },
      )),
    );
  }
}
