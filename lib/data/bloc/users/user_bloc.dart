import 'package:flutter_bloc/flutter_bloc.dart';

import '../../firebase/firebase_provider.dart';
import 'user_events.dart';
import 'user_states.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  FirebaseProvider firebaseProvider;

  UserBloc({
    required this.firebaseProvider,
  }) : super(UserInitialState()) {
    // on<ContactsUserEvent>((event, emit) async {
    //   emit(UserLoadingState());

    //   try {
    //  var contacts = await firebaseProvider.contactsFromFirebase();

    //  emit(UserLoadedState(contactUserCollection: UserModel.fromDoc(contacts.docs)));
    //   } catch (e) {
    //     emit(UserErrorState(errorMsg: e.toString()));
    //   }
    // });
  }
}
