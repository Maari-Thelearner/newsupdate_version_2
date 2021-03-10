import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';
Future<Covid> fetchData() async{
  final response = await http.get('https://disease.sh/v3/covid-19/all');
  if(response.statusCode == 200)
  {
    return Covid.fromJson(json.decode(response.body));
  }
  else
  {
    throw Exception('Failed to load Covid');
  }
}
class Covid{
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int updated;
  final int todayCases;
  final int todayDeaths;
  final int todayRecovered;
  final int critical;
  final int population;
  final int tests;
  final int affectedCountries;
  Covid({this.cases, this.deaths, this.recovered, this.active, this.updated , this.todayDeaths,this.todayRecovered,this.critical,this.todayCases
  ,this.tests,this.population,this.affectedCountries
  });
  factory Covid.fromJson(Map<String,dynamic> jsno){
    return Covid(
        cases: jsno['cases'],
        deaths: jsno['deaths'],
        recovered: jsno['recovered'],
        active: jsno['active'],
        updated: jsno['updated'],
      todayCases: jsno['todayCases'],
      todayDeaths: jsno['todayDeaths'],
      todayRecovered: jsno['todayRecovered'],
      critical: jsno['critical'],
      population: jsno['population'],
      tests: jsno['tests'],
      affectedCountries: jsno['affectedCountries'],
    );
  }
}
class TodayGlobalCovid extends StatefulWidget {
  @override
  _TodayGlobalCovidState createState() => _TodayGlobalCovidState();
}

class _TodayGlobalCovidState extends State<TodayGlobalCovid> {
  Future<Covid> futureCovid;
  @override
  void initState() {
    futureCovid=fetchData();
    super.initState();
  }
  String _dataValue(int timeInMillis)
  {
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    var formattedDate = DateFormat("dd-MM-yyyy hh:mm:ss").format(date);
    return formattedDate.toString();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Covid>(
      future: futureCovid,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Column(
            children: [
              Expanded(
                flex: 10,
                child: DataTable(
                  columnSpacing: 100.0,
                  columns: [
                    DataColumn(label: Text('')),
                    DataColumn(label: Text('')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('1. Cases')),
                      DataCell(Text(snapshot.data.cases.toString())),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2. Deaths')),
                      DataCell(Text(snapshot.data.deaths.toString())),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('3. Recovered')),
                      DataCell(Text(snapshot.data.recovered.toString())),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('4. Active')),
                      DataCell(Text(snapshot.data.active.toString())),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('5. TodayCases')),
                      DataCell(Text(snapshot.data.todayCases.toString())),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('6. TodayDeaths')),
                      DataCell(Text(snapshot.data.todayDeaths.toString())),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('6. TodayRecovery')),
                      DataCell(Text(snapshot.data.todayRecovered.toString())),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('7. Critical')),
                      DataCell(Text(snapshot.data.critical.toString())),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('8. TodayTests')),
                      DataCell(Text(snapshot.data.tests.toString())),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('9. Affected Countries')),
                      DataCell(Text(snapshot.data.affectedCountries.toString())),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('10. World Population')),
                      DataCell(Text(snapshot.data.population.toString())),
                    ]),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Text('LastUpdate : ${_dataValue(snapshot.data.updated)}' ,
                          style: TextStyle(color: Colors.black, fontSize: 15.0 ,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        else if(snapshot.hasError){
          return Text('${snapshot.error}');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
