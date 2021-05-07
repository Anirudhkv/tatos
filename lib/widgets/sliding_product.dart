import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SlidingProduct extends StatelessWidget {
  DocumentSnapshot _trendingReferance;
  SlidingProduct(this._trendingReferance);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.4,
              alignment: Alignment.bottomCenter,
              child: Card(
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    /*Navigator.of(context).pushNamed(
                        TrendingDetailItem.routeName,
                        arguments: _trendingReferance);*/
                  },
                  splashColor: Colors.orangeAccent,
                  child: Hero(
                      tag: _trendingReferance['imageUrl'],
                      child: FadeInImage(
                        placeholder: AssetImage(".."),
                        image: NetworkImage(_trendingReferance['imageUrl']),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.4,
                        fit: BoxFit.cover,
                      ) /*Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: SizeConfig.blockSizeVertical * 18,
                      width: SizeConfig.blockSizeHorizontal * 35,
                    ),*/
                      ),
                ),
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 10,
                  offset: const Offset(3.0, 3.0),
                ),
              ]),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        /*SizedBox(
          height: 30,
        ),*/
        /*Flexible(
          fit: FlexFit.tight,
          child: Text(
            _trendingReferance['name'],
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
        )*/
      ],
    );
  }
}
