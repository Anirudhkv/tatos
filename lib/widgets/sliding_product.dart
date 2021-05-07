import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './cart_symbol.dart';

class SlidingProduct extends StatelessWidget {
  DocumentSnapshot _trendingReferance;
  SlidingProduct(this._trendingReferance);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Stack(
              children: [
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
                Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          Text("₹ ${_trendingReferance['price']}",
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 20)
                        ],
                      ),
                    )),
                Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CartSymbol(),
                        )
                      ],
                    ))
              ],
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
