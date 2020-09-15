import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Card(
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
                          suggestionList[index]['country'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.network(
                          suggestionList[index]['countryInfo']['flag'],
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
                                suggestionList[index]['cases'].toString(),
                            style:
                                TextStyle(color: Colors.grey, fontSize: 20.0),
                          ),
                          Text(
                            'Active:' +
                                suggestionList[index]['active'].toString(),
                            style:
                                TextStyle(color: Colors.blue, fontSize: 20.0),
                          ),
                          Text(
                            'Recovered:' +
                                suggestionList[index]['recovered'].toString(),
                            style:
                                TextStyle(color: Colors.green, fontSize: 20.0),
                          ),
                          Text(
                            'Deaths:' +
                                suggestionList[index]['deaths'].toString(),
                            style: TextStyle(color: Colors.red, fontSize: 20.0),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
