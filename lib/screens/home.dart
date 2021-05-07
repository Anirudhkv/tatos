import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/sliding_product.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 15,
                    width: 30,
                    child: AppBarScreen(),
                  ),
                  Text('Natur.',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 25),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () => {},
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.mic),
                      onPressed: () => {},
                    ),
                    hintText: 'Search for products.',
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).accentColor),
                        borderRadius: BorderRadius.circular(13))),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('chairs')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (ctx, index) =>
                                SlidingProduct(snapshot.data.docs[index]),
                            itemCount: snapshot.data.docs.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        );
                      }),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              indent: 5,
              endIndent: 5,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Text('Categories',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }
}
