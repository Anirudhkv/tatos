import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(32)),
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 60,
                bottom: 16,
                left: 16,
                right: 16,
              ),
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.transparent,
                    offset: const Offset(0.0, 5.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Success!",
                    style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 5,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Success created account \nYou can login now",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  SizedBox(height: 24.0),
                  InkWell(
                      splashColor: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        width: double.infinity,
                        child: Text(
                          "OK",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32)),
                      ))
                ],
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.check_sharp,
                  color: Theme.of(context).accentColor,
                  size: 50,
                ),
                radius: 50,
              ),
            ),
          ],
        )
      ],
    );
  }
}
