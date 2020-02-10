import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: "statefull application",
    debugShowCheckedModeBanner: false,
    home: SIform(),
    theme: ThemeData(
      hintColor: Colors.orange,
      buttonColor: Colors.redAccent,
      accentColor: Colors.deepOrangeAccent,
      primaryColor: Colors.deepOrange,
      cursorColor: Colors.blue,
    ),
  ));
}

class SIform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIformstate();
  }
}

class _SIformstate extends State<SIform> {
  final minimumpadding = 6.0;

  var _currencies = ['rupee', 'pounds', 'dollar'];
  var itemselcted = "";
  var Validator = "";
  var disply_results = '';
  var _formkey = GlobalKey<FormState>();
  TextEditingController priciple = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController term = TextEditingController();
  TextEditingController results = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemselcted = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .title;

    return Scaffold(
      appBar: AppBar(
        title: Text("my calc app"),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
            padding: EdgeInsets.all(minimumpadding),
            child: ListView(
              children: <Widget>[
                ImageAsset(),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: minimumpadding, top: minimumpadding),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "enter discount amount";
                        }
                      },
                      controller: priciple,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 10.0,
                          ),
                          labelText: "principal",
                          hintText: "enter you principal eg 1200",
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(minimumpadding)))),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: minimumpadding, top: minimumpadding),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "enter rate of discounted interst";
                        }
                      },
                      controller: rate,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 10.0,
                          ),
                          labelText: "rate of intrested",
                          hintText: "in percent",
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(minimumpadding)))),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: minimumpadding, top: minimumpadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: textStyle,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "enter time to  be discounted";
                                }
                              },
                              controller: term,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 10.0,
                                  ),
                                  labelText: "Time",
                                  hintText: "Time in years ",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          minimumpadding)))),
                        ),
                        Container(
                          width: minimumpadding * 5,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                              items: _currencies.map((String value) {
                                return DropdownMenuItem<String>(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
                              value: itemselcted,
                              onChanged: (String Newvalueselected) {
                                onDropdown(Newvalueselected);
                              },
                            ))
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: minimumpadding, top: minimumpadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                                child: Text("Calculate ",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    )),
                                onPressed: () {
                                  setState(() {
                                    if (_formkey.currentState.validate()) {
                                      this.disply_results = calculatereturns();
                                    }
                                  });

                                  //action
                                })),
                        Container(
                          width: minimumpadding * 5,
                        ),
                        Expanded(
                            child: RaisedButton(
                                child: Text(" reset",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    )),
                                onPressed: () {
                                  if (_formkey.currentState.validate()) {
                                    rest();
                                  }
                                  else{
                                    rest();
                                  }


                                  //action
                                }))
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: minimumpadding, top: minimumpadding),
                    child: Text(
                      this.disply_results,
                      style: textStyle,
                    ))
              ],
            )),
      ),
    );
  }

  Widget ImageAsset() {
    AssetImage assetimage = AssetImage('images/headphone.jpg');
    Image image = Image(
      image: assetimage,
      height: 125.0,
      width: 125.0,
    );
    return Container(child: image);
  }

  void onDropdown(String newvalueselected) {
    setState(() {
      this.itemselcted = newvalueselected;
    });
  }

  String calculatereturns() {
    double prin = double.parse(priciple.text);
    double tim = double.parse(term.text);
    double rat = double.parse(rate.text);
    double total = prin + (prin * tim * rat) / 100;
    String result = "after$tim year your investment will be $total";
    return result;
  }

  void rest() {
    priciple.text = "";
    term.text = "";
    rate.text = "";
    results.text = "";
    this.disply_results = "";

    Validator(String value) {
      if (value.isEmpty) {
        return "";
      }
    };
  }
}
