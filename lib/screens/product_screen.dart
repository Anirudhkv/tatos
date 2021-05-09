import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/database.dart';
import '../utils/google_sign_in.dart';
import '../utils/email_password.dart';
import '../widgets/customdiaglog.dart';

class ScreenArguments {
  final DocumentSnapshot productDatas;
  final int check;

  ScreenArguments(this.productDatas, this.check);
}

class ProductScreen extends StatelessWidget {
  static const routeName = "/rough";
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final DocumentSnapshot productData = args.productDatas;
    print(userId);
    return Scaffold(
        backgroundColor: Color.fromRGBO(232, 219, 210, 1),
        body: Column(
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

            // Positioned(top: 55, left: 15, child: Icon(Icons.arrow_back_outlined)),
            /*Positioned(
            top: 55,
            right: 15,
            child: Icon(Icons.favorite_border),
          )*/

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
                          margin: EdgeInsets.only(left: 16, right: 16),
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
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                EdgeInsets.only(top: 20, left: 35, right: 25),
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

                                                //Navigator.of(context).pop(),
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
        ));
  }
}
