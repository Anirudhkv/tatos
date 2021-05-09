import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<String> addOrUpdateUser(String userId, String name, String address,
    String state, String pincode, String phone) {
  var items = {
    'name': name,
    'address': address,
    'pincode': pincode,
    'state': state,
    'phone': phone,
  };
  Map<String, String> input = {};
  items.forEach((key, value) {
    if (value.isNotEmpty) {
      input[key] = value;
    }
  });

  return users
      .doc(userId)
      .set(input, SetOptions(merge: true))
      .then((value) => "Success")
      .catchError((e) => "Error");
}

Future<void> newUser(id) {
  var db = FirebaseFirestore.instance;
  var docRef = db.collection("users").doc(id);

  return docRef.get().then((doc) => {
        if (!doc.exists)
          {
            users.doc(id).set({
              'name': null,
              'address': null,
              'pincode': null,
              'state': null,
              'phone': null,
            })
          }
      });
}

Future<String> placeOrder(String userId, String itemId) {
  CollectionReference orders = FirebaseFirestore.instance.collection('order');

  return orders
      .add({'userId': userId, 'itemId': itemId, 'orderDate': DateTime.now()})
      .then((value) => "Success")
      .catchError((e) => "Error");
}
