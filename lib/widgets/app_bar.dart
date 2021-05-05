import 'package:flutter/material.dart';

class AppBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.brown,
            ),
            height: 3,
          ),
          SizedBox(height: 2.5),
          Container(
            decoration: BoxDecoration(
              color: Colors.brown,
            ),
            height: 3,
          ),
          SizedBox(height: 2.5),
          Container(
            decoration: BoxDecoration(
              color: Colors.brown,
            ),
            height: 3,
          )
        ],
      ),
    );
  }
}
