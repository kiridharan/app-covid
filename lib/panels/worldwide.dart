import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: <Widget>[
          StatusPanel(
            textColor: Colors.grey[700],
            title: 'CONFIRMED',
            panelcolor: Colors.cyan[100],
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            panelcolor: Colors.green[100],
            textColor: Colors.green[700],
            title: 'RECOVERED',
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            panelcolor: Colors.red[100],
            textColor: Colors.red,
            title: 'DEATH',
            count: worldData['deaths'].toString(),
          ),
          StatusPanel(
            panelcolor: Colors.pink[100],
            textColor: Colors.pink[700],
            title: 'ACTIVE',
            count: worldData['active'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color textColor;
  final Color panelcolor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.textColor, this.title, this.count, this.panelcolor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 2,
            spreadRadius: .5,
          )
        ],
        color: panelcolor,
      ),
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$title:',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            count,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

class QuestionPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            color: Colors.deepOrange,
            child: Row(
              children: <Widget>[
                Text('You Know want More'),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            color: Colors.deepOrange,
            child: Row(
              children: <Widget>[
                Text('You Know want More'),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
