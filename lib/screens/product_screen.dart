import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/database.dart';
import '../utils/google_sign_in.dart';
import '../utils/email_password.dart';
import '../widgets/customdiaglog.dart';
import '../widgets/spinner.dart';

class ScreenArguments {
  final DocumentSnapshot productDatas;
  final int check;

  ScreenArguments(this.productDatas, this.check);
}

class ProductScreen extends StatefulWidget {
  static const routeName = "/rough";

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final DocumentSnapshot productData = args.productDatas;
    var _isFavorite = false;
    print(userId);
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 219, 210, 1),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: productData['imageUrl'],
                  child: Container(
                    child: Image.network(
                      productData['imageUrl'],
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => {Navigator.of(context).pop()},
                  icon: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08,
                        left: 20),
                    child: Icon(
                      Icons.arrow_back,
                      size: 35,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => {
                    setState(() {
                      print('hello');
                      _isFavorite = !_isFavorite;
                    })
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08,
                        right: 15,
                        left: MediaQuery.of(context).size.width * 0.85),
                    child: Icon(
                      !_isFavorite ? Icons.favorite_border : Icons.favorite,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(25)),
                ),
                child: Container(
                    height: MediaQuery.of(context).size.height * .55,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productData['name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "₹ ${productData["price"]}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          padding: const EdgeInsets.only(
                              top: 26.0, left: 16, right: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    child: Column(
                                  children: [
                                    Image.asset("asset/images/group.png"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("24*19*18"),
                                    )
                                  ],
                                )),
                                Container(
                                    child: Column(
                                  children: [
                                    Image.asset("asset/images/palm.png"),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 9),
                                      child: Text("Palm"),
                                    )
                                  ],
                                )),
                                Container(
                                    child: Column(
                                  children: [
                                    Image.asset("asset/images/flag.png"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Indonesia"),
                                    )
                                  ],
                                )),
                                Container(
                                    child: Column(
                                  children: [
                                    Image.asset("asset/images/badge.png"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("5 years"),
                                    )
                                  ],
                                ))
                              ]),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.17,
                            padding:
                                EdgeInsets.only(top: 45, left: 35, right: 25),
                            child: Text(
                              productData['detail'],
                              overflow: TextOverflow.clip,
                              style: TextStyle(fontSize: 16),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20, left: 35, right: 25, bottom: 10),
                          child: Container(
                              height: 55,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context)
                                        .dialogBackgroundColor),
                                onPressed: () {
                                  placeOrder(args.check == 1 ? userId : id,
                                          productData.id)
                                      .then((value) => {
                                            if (value == 'Success')
                                              {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) => SuccessDialog(
                                                      "Order Placed",
                                                      "Your order have been placed",
                                                      Icons.done_sharp,
                                                      Theme.of(context)
                                                          .dialogBackgroundColor),
                                                ),
                                              }
                                            else
                                              {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) => SuccessDialog(
                                                      "Failed",
                                                      "Failed in placing order",
                                                      Icons.error,
                                                      Colors.red),
                                                )
                                              }
                                          });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7)),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 80.0),
                                          child: Text(
                                            ' Place Order ',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.shopping_cart_outlined,
                                          color: Colors.white,
                                        ),
                                      ],
                                    )),
                              )),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
