import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String imageUrl;
  final String name;
  Item(this.imageUrl, this.name);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => {},
          child: Column(children: [
            Container(
                padding: EdgeInsets.all(15),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.15,
                  color: Colors.white,
                ) /*FadeInImage(
                  placeholder: AssetImage(".."),
                  image: NetworkImage(imageUrl),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),*/
                ,
                height: MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width * 0.24,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown[300],
                      blurRadius: 5,
                      offset: const Offset(3.0, 3.0),
                    ),
                  ],
                  // border: Border.all(color: Colors.white, width: 0),
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center),
            SizedBox(height: 5),
            Text(name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(106, 147, 71, 1),
                ))
          ]),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
