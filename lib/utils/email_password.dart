import 'package:firebase_auth/firebase_auth.dart';
import '../helpers/http_exception.dart';

String emailId;
String photoURL;
String phone;
String displayName;
String id;

Future<User> signUp(String email, String password) async {
  try {
    UserCredential result = (await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password));
    final User user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    return user;
  } catch (e) {
    HttpException(e);
    return e;
  }
}

Future<User> signIn(String email, String password) async {
  try {
    UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    final User currentUser = FirebaseAuth.instance.currentUser;
    assert(user.uid == currentUser.uid);
    emailId = email;
    photoURL = user.photoURL;
    phone = user.phoneNumber;
    displayName = user.displayName;
    id = user.uid;
    print(user);
    return user;
  } catch (e) {
    HttpException(e);
    return null;
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
  final User currentUser = null;
}
