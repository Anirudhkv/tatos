import 'package:flutter/material.dart';

class AppBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 3,
          width: 30,
          child: Row(
            children: [
              SizedBox(width: 10),
              Container(
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.brown,
                ),
              ),
            ],
          ),
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
          height: 3,
          width: 30,
          child: Row(
            children: [
              Container(
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.brown,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        )
      ],
    );
  }
}
