import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'TodayIndiaCovid.dart';
import 'YesterdayIndiaCovid.dart';

class CovidindiaHomePage extends StatefulWidget {
  @override
  _CovidindiaHomePageState createState() => _CovidindiaHomePageState();
}

class _CovidindiaHomePageState extends State<CovidindiaHomePage> with SingleTickerProviderStateMixin{
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
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.black),
              expandedHeight: 200.0,
              pinned: true,
              floating: false,
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
              flexibleSpace: FlexibleSpaceBar(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CovidUpdate',style: TextStyle(color: Colors.redAccent ,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 15.0),),
                    Text('India',style: GoogleFonts.kanit(color: Colors.redAccent,fontStyle: FontStyle.italic,fontSize: 12.0),)
                  ],
                ),
                background: Image.asset('assets/images/indiaimage.jpg',
                fit: BoxFit.cover,
                )
              ),

            ),
            SliverFillRemaining(
              child: new TabBarView(
                  controller: _tabController,
                  children:[
                    new YesterdayIndiaCovid(),
                    new TodayIndiaCovid(),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
