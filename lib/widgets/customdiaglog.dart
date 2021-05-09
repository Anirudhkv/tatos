import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  SuccessDialog(this.title, this.subtitle, this.icon, this.color);

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
                color: Colors.white,
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
                    title,
                    style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                        color: color),
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
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  SizedBox(height: 24.0),
                  InkWell(
                      splashColor: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      onTap: () {
                        Navigator.of(context).pop();
                        if (title == "Signed Out") {
                          Navigator.of(context)
                              .pushReplacementNamed(LoginPage.routeName);
                        }
                        if (title == "Order Placed") {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        width: double.infinity,
                        child: Text(
                          "OK",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: color,
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
                backgroundColor: color,
                child: Icon(
                  icon,
                  color: Colors.white,
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
