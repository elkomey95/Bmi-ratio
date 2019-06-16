import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _age = new TextEditingController();
  final _height = new TextEditingController();
  final _weight = new TextEditingController();
  double result = 0.0;
  String reading = '';

  void _back() {
    _age.clear();
    _weight.clear();
    _height.clear();
    result = 0.0;
    reading = " ";
  }

  void _calculate() {
    setState(() {
      double height = double.parse(_height.text);
      double weight = double.parse(_weight.text);

      if (_weight.text.isNotEmpty &&
          _age.text.isNotEmpty &&
          _height.text.isNotEmpty &&
          (weight > 0.0 && height > 0.0)) {
        result = weight / (height * height);
        if (double.parse(result.toStringAsFixed(1)) < 18.5)
          reading = "Underweight";
        else if (double.parse(result.toStringAsFixed(1)) >= 18.5 && result < 25)
          reading = "Normal";
        else if (double.parse(result.toStringAsFixed(1)) >= 25 && result < 30)
          reading = "Overweight";
        else
          reading = "Obese";
      } else
        result = 0.0;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: new Text("BMI"),
          centerTitle: true,
          backgroundColor: Colors.pink.shade300,
        ),
        body: new Container(
          alignment: Alignment.topCenter,
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("images/bmilogo.png"),
        ),
        new Container(
          margin: new EdgeInsets.symmetric(horizontal: 4.0),
          color: Colors.grey[400],
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new TextField(
                controller: _age,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Age",
                    icon: new Icon(
                      Icons.person,
                      color: Colors.pinkAccent,
                    )),
              ),
              new TextField(
                controller: _height,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Height in m",
                    icon: new Icon(
                      Icons.insert_chart,
                      color: Colors.pinkAccent,
                    )),
              ),
              new TextField(
                controller: _weight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Weight in kg.",
                    icon: new Icon(
                      Icons.line_weight,
                      color: Colors.pinkAccent,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: new Center(
                    child: new RaisedButton(
                        onPressed: _calculate,
                        child: new Text("Calculate"),
                        color: Colors.pink,
                        textColor: Colors.white)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: new Text(
            "BMI : ${result.toStringAsFixed(1)}",
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.5,
                color: Colors.blue),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            "$reading",
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.pinkAccent),
          ),
        ),
        new Container(
            alignment: Alignment.bottomCenter,
            child: new Column(
              children: <Widget>[
                new InkWell(
                  child: Center(
                    child: new Text(
                      "clear",
                      style: new TextStyle(
                          color: Colors.grey

                      ),),
                  ),
                  onTap: _back,
                )
              ],
            )
        )
    ],
    )
    )

    );


  }
}
