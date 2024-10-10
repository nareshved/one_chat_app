import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_chat_app/data/bloc/users/user_bloc.dart';
import 'package:one_chat_app/data/bloc/users/user_events.dart';
import 'package:one_chat_app/data/firebase/firebase_provider.dart';
import 'package:one_chat_app/domain/models/message_model.dart';
import 'package:one_chat_app/repository/widgets/chat_page_widgets/chat_bubble.dart';
import '../../widgets/text_feild/text_field.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.toId,
  });

  final toId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     getAllmsg();
//   }

//   Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getAllmsg() async {
//     // for get all msg for bloc firebase
//     return FirebaseProvider.getAllMsg(toId: widget.toId);
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat page"),
        actions: const [
          Icon(Icons.call),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.video_camera_back)
        ],
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.all(12),
        child: myTextField(
            suffIcon: IconButton(
                onPressed: () {
                  if (messageController.text.isNotEmpty) {
                    BlocProvider.of<UserBloc>(context).add(SendMessageEvent(
                      msg: messageController.text.trim(),
                      toId: widget.toId,
                    ));
                  }
                },
                icon: const Icon(Icons.send)),
            hinttxt: "message a new",
            mcrontroller: messageController,
            labelTxt: "message"),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseProvider.getAllMsg(toId: widget.toId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Text("error try again");
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    MessageModel eachMessage =
                        MessageModel.fromDoc(snapshot.data!.docs[index].data());

                    var fromId = eachMessage.fromId;

                    if (fromId == FirebaseProvider.userId) {
                      return ChatBubble(
                          message: eachMessage,
                          time: eachMessage.sentAt!,
                          seenIcon: Icons.check,
                          imgUrl: "",
                          isComing: false);
                    } else {
                      ChatBubble(
                          message: eachMessage,
                          time: eachMessage.sentAt!,
                          seenIcon: Icons.not_interested_rounded,
                          imgUrl: "",
                          isComing: true);
                    }
                    return const Center(
                      child: Text("No message"),
                    );
                  },
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}









// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:one_chat_app/data/bloc/users/user_bloc.dart';
// import 'package:one_chat_app/data/bloc/users/user_events.dart';
// import 'package:one_chat_app/data/bloc/users/user_states.dart';
// import 'package:one_chat_app/data/firebase/firebase_provider.dart';
// import 'package:one_chat_app/domain/models/message_model.dart';
// import 'package:one_chat_app/repository/widgets/chat_page_widgets/chat_bubble.dart';
// import '../../widgets/text_feild/text_field.dart';

// class ChatPage extends StatefulWidget {
//   const ChatPage({
//     super.key,
//     required this.toId,
//   });

//   final toId;

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   final TextEditingController messageController = TextEditingController();

// //   @override
// //   void initState() {
// //     super.initState();
// //     getAllmsg();
// //   }

// //   Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getAllmsg() async {
// //     // for get all msg for bloc firebase
// //     return FirebaseProvider.getAllMsg(toId: widget.toId);
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Chat page"),
//         actions: const [
//           Icon(Icons.call),
//           SizedBox(
//             width: 20,
//           ),
//           Icon(Icons.video_camera_back)
//         ],
//       ),
//       bottomNavigationBar: Container(
//         margin: const EdgeInsets.all(12),
//         child: myTextField(
//             suffIcon: IconButton(
//                 onPressed: () {
//                   BlocProvider.of<UserBloc>(context).add(SendMessageEvent(
//                     msg: messageController.text.trim(),
//                     toId: widget.toId,
//                   ));
//                 },
//                 icon: const Icon(Icons.send)),
//             hinttxt: "message a new",
//             mcrontroller: messageController,
//             labelTxt: "message"),
//       ),
//       body: ListView(
//         children: [
//           Flexible(child: BlocBuilder<UserBloc, UserStates>(
//             builder: (context, state) {
//               if (state is UserLoadingState) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (state is UserErrorState) {
//                 return Center(
//                   child: Text(state.errorMsg),
//                 );
//               } else if (state is UserLoadedState) {
//                 return StreamBuilder(
//                   stream: FirebaseProvider.getAllMsg(toId: widget.toId),
//                   builder: (context, snapshot) {
//                     return ListView.builder(
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: (context, index) {
//                         MessageModel eachMessage = MessageModel.fromDoc(
//                             snapshot.data!.docs[index].data());

//                         var fromId = eachMessage.fromId;

//                         if (fromId == FirebaseProvider.userId) {
//                           return ChatBubble(
//                               message: eachMessage,
//                               time: eachMessage.sentAt!,
//                               seenIcon: Icons.check,
//                               imgUrl: "",
//                               isComing: false);
//                         } else {
//                           ChatBubble(
//                               message: eachMessage,
//                               time: eachMessage.sentAt!,
//                               seenIcon: Icons.not_interested_rounded,
//                               imgUrl: "",
//                               isComing: true);
//                         }
//                       },
//                     );
//                   },
//                 );
//               }

//               return const Center(
//                 child: Text("No message"),
//               );
//             },
//           )),
//         ],
//       ),
//     );
//   }
// }
