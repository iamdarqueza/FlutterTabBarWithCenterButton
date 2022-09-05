import 'package:tradeshare_tabbar/page/home_page_widget.dart';
import 'package:tradeshare_tabbar/page/wallet_page_widget.dart';
import 'package:tradeshare_tabbar/page/currency_page_widget.dart';
import 'package:tradeshare_tabbar/page/account_page_widget.dart';
import 'package:tradeshare_tabbar/widget/tabbar_material_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = '';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.green),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  final pages = <Widget>[
    HomePageWidget(),
    WalletPageWidget(),
    CurrencyPageWidget(),
    AccountPageWidget(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBody: true,
        body: pages[index],
        bottomNavigationBar: TabBarMaterialWidget(
          index: index,
          onChangedTab: onChangedTab,
        ),
        floatingActionButton: FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.menu,
              size: 40,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xffF2F047), Color(0xff72E24C)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
