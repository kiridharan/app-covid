import 'dart:convert';
import 'package:covid19/Widget/progress.dart';
import 'package:covid19/Widget/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:line_icons/line_icons.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countrydata;
  fetchCountryData() async {
    http.Response respone =
        await http.get('https://corona.lmao.ninja/v2/countries');
    if (this.mounted) {
      setState(
        () {
          countrydata = jsonDecode(respone.body);
        },
      );
    }
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              LineIcons.search,
              color: Colors.white,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(countrydata),
              );
            },
          )
        ],
        backgroundColor: Colors.black,
        title: Text('Country Data'),
        titleSpacing: 10.0,
      ),
      body: countrydata == null
          ? Center(
              child: Progress(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white.withOpacity(.3),
                  child: Container(
                    height: 130,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                countrydata[index]['country'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Image.network(
                                countrydata[index]['countryInfo']['flag'],
                                height: 70,
                                width: 80,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Confirmed:' +
                                      countrydata[index]['cases'].toString(),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Active:' +
                                      countrydata[index]['active'].toString(),
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Recovered:' +
                                      countrydata[index]['recovered']
                                          .toString(),
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Deaths:' +
                                      countrydata[index]['deaths'].toString(),
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: countrydata == null ? 0 : countrydata.length,
            ),
    );
  }
}
