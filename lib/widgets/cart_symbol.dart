import 'package:flutter/material.dart';
import 'package:intern/screens/product_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartSymbol extends StatelessWidget {
  final DocumentSnapshot _trendingReferance;
  final int check;
  CartSymbol(this._trendingReferance, this.check);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).pushNamed(ProductScreen.routeName,
            arguments: ScreenArguments(_trendingReferance, check))
      },
      child: Stack(children: [
        Container(
            child: Icon(Icons.add_shopping_cart_sharp,
                color: Colors.white, size: 30),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.white, width: 0),
              color: Theme.of(context).dialogBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center),
      ]),
    );
  }
}
