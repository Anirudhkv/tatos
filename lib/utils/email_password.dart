import 'package:firebase_auth/firebase_auth.dart';
import '../helpers/http_exception.dart';

Future<User> signUp(String email, String password) async {
  try {
    UserCredential result = (await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password));
    final User user = result.user;
    print(user);
    // final User user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    return user;
  } catch (e) {
    //HttpException(e);
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
    return user;
  } catch (e) {
    HttpException(e);
    return null;
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
