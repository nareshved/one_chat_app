import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserEvents {}

class ContactsUserEvent extends UserEvents {
  List<QuerySnapshot<Map<String, dynamic>>> getUsers;

  ContactsUserEvent({required this.getUsers});
}
