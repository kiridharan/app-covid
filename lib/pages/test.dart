import 'package:covid19/India/Frontpage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final name = TextEditingController();
  final phoneNumber = TextEditingController();

  getItemAndNavigate(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              IndiaData(statename: name.text, districname: phoneNumber.text),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: <Widget>[
            Container(
                width: 280,
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: name,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Enter Name Here'),
                )),
            Container(
                width: 280,
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: phoneNumber,
                  autocorrect: true,
                  decoration:
                      InputDecoration(hintText: 'Enter Phone Number Here'),
                )),
            RaisedButton(
              onPressed: () => getItemAndNavigate(context),
              color: Color(0xffFF1744),
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child:
                  Text('Click Here To Send All Entered Items To Next Screen'),
            ),
          ],
        ),
      )),
    );
  }
}

// class SecondScreen extends StatelessWidget {
//   final nameHolder;
//   final numberHolder;

//   SecondScreen({Key key, @required this.nameHolder, this.numberHolder})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Second Activity Screen"),
//         ),
//         body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Center(
//                   child: Text(
//                 'Student Name = ' + nameHolder,
//                 style: TextStyle(fontSize: 22),
//                 textAlign: TextAlign.center,
//               )),
//               Center(
//                   child: Text(
//                 'Student Phone Number = ' + numberHolder,
//                 style: TextStyle(fontSize: 22),
//                 textAlign: TextAlign.center,
//               )),
//               RaisedButton(
//                 onPressed: () => goBack(context),
//                 color: Colors.lightBlue,
//                 textColor: Colors.white,
//                 child: Text('Go Back To Previous Screen'),
//               )
//             ]));
//   }
// }
