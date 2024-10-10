import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserEvents {}

class ContactsUserEvent extends UserEvents {
  List<QuerySnapshot<Map<String, dynamic>>> getUsers;

  ContactsUserEvent({required this.getUsers});
}

class GetChatIdEvent extends UserEvents {
  String fromId;
  String toId;

  GetChatIdEvent({required this.fromId, required this.toId});
}

class SendMessageEvent extends UserEvents {
  String msg;
  String toId;
  // String userId;

  SendMessageEvent({
    required this.msg,
    required this.toId,
  });
}

class SendImageMsgEvent extends UserEvents {
  String imgUrl;
  String toId;
  String? imgMsg;
  String userId;

  SendImageMsgEvent(
      {required this.imgUrl,
      required this.toId,
      this.imgMsg,
      required this.userId});
}

class GetAllMsgEvent extends UserEvents {
  // String userId;
  String toId;

  GetAllMsgEvent({
    required this.toId,
  });
}
