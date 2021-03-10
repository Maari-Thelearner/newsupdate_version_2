import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CovidIndiaHome.dart';
import 'TodayGlobalCovidTab.dart';
import 'YesterdayGlobalCovidTab.dart';

class CovidHomepage extends StatefulWidget {
  @override
  _CovidHomepageState createState() => _CovidHomepageState();
}

class _CovidHomepageState extends State<CovidHomepage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this , initialIndex: 0)..addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
              SliverAppBar(
                iconTheme: IconThemeData(color: Colors.black),
                expandedHeight: 200.0,
                pinned: true,
                floating: false,
                flexibleSpace: FlexibleSpaceBar(
                  title: FlatButton(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('CovidUpdate',style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 15.0),),
                        Text('Global',style: GoogleFonts.kanit(color: Colors.redAccent,fontStyle: FontStyle.italic,fontSize: 10.0),)
                      ],
                    ),
                  ),
                  background: Image.asset('assets/images/globalimage.jpg',
                  fit: BoxFit.cover,
                  )
                ),
        bottom: TabBar(
          indicatorColor: Colors.grey,
          controller: _tabController,
          labelColor: Colors.redAccent,
          labelStyle: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
          tabs: [
            Tab(text: 'Yesterday'),
            Tab(text: 'Today',),
          ],
        ),
                actions: [
                  FlatButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CovidindiaHomePage();
                    }));
                  }, child: Text('IndiaUpdate',style: GoogleFonts.kanit(fontWeight: FontWeight.bold,fontSize: 15.0),))
                ],
              ),
              SliverFillRemaining(
                child: new TabBarView(
                    controller: _tabController,
                    children:[
                      new YesterdayGlobalCovid(),
                      new TodayGlobalCovid(),
                    ]),
              ),
          ],
        ),
    ),
    );
  }
}
