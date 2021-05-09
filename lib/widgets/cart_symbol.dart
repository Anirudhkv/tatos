import 'package:flutter/material.dart';
import 'package:intern/screens/rough.dart';


class CartSymbol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).pushNamed(Rough.routeName)
      },
      child: Stack(children: [
        Container(
            child: Icon(Icons.add_shopping_cart_sharp,
                color: Colors.white, size: 30),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.white, width: 0),
              color: Color.fromRGBO(106, 147, 71, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center),
      ]),
    );
  }
}
