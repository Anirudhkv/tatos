import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/sliding_product.dart';
import '../widgets/item.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Container(
        height: 10,
        child: Scaffold(
          drawer: MainDrawer(),
          appBar: AppBar(
            bottom: TabBar(
              labelPadding: EdgeInsets.all(0),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(text: "New"),
                Tab(
                  text: "Popular",
                ),
              ],
            ),
            toolbarHeight: 110,
            actions: [
              FlatButton(
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 28,
                    child: CircleAvatar(
                      child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('../../asset/images/propic.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      radius: 25,
                    ),
                  ),
                  onPressed: () => {})
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
            /*bottom: TabBar(
              tabs: [
                Tab(
                  text: "New",
                ),
                Tab(
                  text: "Popular",
                ),
                Tab(
                  text: "Sale",
                )
              ],
            ),*/
          ),
          body: TabBarView(children: [
            SingleChildScrollView(child: NewFurnitures()),
            SingleChildScrollView(child: NewFurnitures())
          ]),
        ),
      ),
    );
  }
}

class NewFurnitures extends StatelessWidget {
  const NewFurnitures({
    Key key,
  }) : super(key: key);

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
