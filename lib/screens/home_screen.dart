import 'package:flutter/material.dart';
import 'package:intern/utils/email_password.dart';
import 'package:intern/utils/google_sign_in.dart';
import '../widgets/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/sliding_product.dart';
import '../widgets/item.dart';
import '../widgets/drawer.dart';
import 'user_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    final check = ModalRoute.of(context).settings.arguments;
    final mediaQuery = MediaQuery.of(context).size;
    var decorationImage = DecorationImage(
        image: check == 1
            ? NetworkImage(imageUrl)
            : AssetImage('asset/images/propic.png'),
        fit: BoxFit.cover);
    return DefaultTabController(
      length: 2,
      child: Container(
        height: 10,
        child: Scaffold(
          drawer: MainDrawer(check),
          appBar: AppBar(
            bottom: TabBar(
              labelPadding: EdgeInsets.all(0),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(text: "New"),
                Tab(text: "Popular"),
              ],
            ),
            toolbarHeight: 110,
            actions: [
              FlatButton(
                  child: Hero(
                    tag: check == 1 ? userId : id,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      radius: 26,
                      child: CircleAvatar(
                        child: Container(
                          alignment: Alignment.center,
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: decorationImage,
                          ),
                        ),
                        radius: 25,
                      ),
                    ),
                  ),
                  onPressed: () => {
                        Navigator.of(context)
                            .pushNamed(UserScreen.routeName, arguments: check)
                      })
            ],
            centerTitle: true,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 15,
                    width: 60,
                    child: AppBarScreen(),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                  color: Theme.of(context).accentColor,
                );
              },
            ),
            title: Text('Natur.',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.white12,
            elevation: 0,
          ),
          body: TabBarView(children: [
            SingleChildScrollView(child: NewFurnitures(check)),
            SingleChildScrollView(child: NewFurnitures(check))
          ]),
        ),
      ),
    );
  }
}

class NewFurnitures extends StatelessWidget {
  final int check;
  NewFurnitures(this.check);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: () => {},
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.mic_none_outlined,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: () => {},
                  ),
                  hintText: 'Search for products.',
                  hintStyle: TextStyle(color: Theme.of(context).accentColor),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor),
                      borderRadius: BorderRadius.circular(13))),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Divider(
            color: Theme.of(context).primaryColor,
            indent: 5,
            endIndent: 5,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                              SlidingProduct(snapshot.data.docs[index], check),
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
              )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('items')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (ctx, index) => Item(
                              snapshot.data.docs[index]['imageUrl'],
                              snapshot.data.docs[index]['name']),
                          itemCount: snapshot.data.docs.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
