import 'package:flutter/material.dart';

class CartSymbol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Stack(children: [
        Container(
            child: Icon(Icons.add_shopping_cart_sharp,
                color: Colors.white, size: 30),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.white, width: 0),
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center),
      ]),
    );
  }
}
