import 'dart:convert';
import 'package:covid19/Widget/progress.dart';
import 'package:covid19/panels/countryData.dart';
import 'package:covid19/panels/worldwide.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Map worldData;
  fetchWorldWIdeData() async {
    http.Response respone =
        await http.get('https://disease.sh/v3/covid-19/all');
    if (this.mounted) {
      setState(
        () {
          worldData = jsonDecode(respone.body);
        },
      );
    }
  }

  List countryData;
  fetchCountryData() async {
    http.Response respone =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    if (this.mounted) {
      setState(
        () {
          countryData = jsonDecode(respone.body);
        },
      );
    }
  }

  Future fetchData() async {
    fetchWorldWIdeData();
    fetchCountryData();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'CoVid19 DashBoard',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: worldData == null
            ? Center(child: Progress())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Worldwide',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    WorldWidePanel(
                      worldData: worldData,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Top five countries affected',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    countryData == null
                        ? Container()
                        : CountryData(
                            countryData: countryData,
                          ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: null,
    );
  }
}
