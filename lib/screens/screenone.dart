import 'dart:math';
import 'package:flutter/material.dart';

class screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.only(top: 40.0, left: 30.0, right: 10.0),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "my flight",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 25.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w100),
                  )),
                  Expanded(
                      child: Text(
                    "Took me from kenya to uganda ",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w100),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "my shipment",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 25.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w100),
                  )),
                  Expanded(
                      child: Text(
                    "Took me from ug kampala to uganda ",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w100),
                  )),
                ],
              ),
              image(),
              Button()
            ],
          )),
    );
  }
}

class image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetimage = AssetImage('images/headphone.jpg');
    Image image = Image(
      image: assetimage,
      height: 100.0,
      width: 100.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.only(top: 40.0),
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      width: 250.0,
      height: 50.0,
      child: RaisedButton(
          child: Text("book Flight",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700)),
          elevation: 8.0,
          onPressed: () {
            bookfligt(context);
            //action
          }),
    );
  }

  void bookfligt(BuildContext context) {
    var alertdialog = AlertDialog(
      title: Text("you flight is being booked"),
      content: Text("text have been booked succesfully"),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertdialog;
        });
  }
}
