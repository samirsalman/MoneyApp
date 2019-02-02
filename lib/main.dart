import 'package:flutter/material.dart';
import 'Fonts.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
          primaryColor: Colors.orange, buttonColor: Colors.orangeAccent),
      home: MyHomePage(title: 'Sondaggi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;

  List<TabData> _bottomItems = [
    TabData(iconData: Icons.home, title: "Home"),
    TabData(iconData: Icons.monetization_on, title: "Gestisci le finanze")
  ];

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          int a=0;
        },
        elevation: 1.5,
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FancyBottomNavigation(
        tabs: _bottomItems,
        initialSelection: _currentIndex,
        onTabChangedListener: (index) {
          changeIndex(index);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 10,
        title: new Image.asset(
          "assets/logo.png",
          width: 200,
          height: 50,
        ),
        centerTitle: true,
      ),
      body: ListView(children: [
        _accountInfo("Samir", "Salman", null),
        _moneyInfo(500.00),
      ]),
    );
  }

  Widget _accountInfo(String nome, String cognome, FileImage image) {
    return Container(
      height: 220,
      margin: EdgeInsets.all(10),
      child: GradientCard(
        gradient: Gradients.hotLinear,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              nome,
              style: Fonts.number,
            ),
            ClipOval(
                child: Image.network(
              "https://image.freepik.com/icone-gratis/utente-maschio-close-up-forma-per-facebook_318-37635.jpg",
              fit: BoxFit.cover,
              width: 70.0,
              height: 70.0,
            )),
            Text(
              cognome,
              style: Fonts.number,
            ),
          ],
        ),
      ),
    );
  }

  Widget _moneyInfo(double counter) {
    return Container(
      height: 180,
      margin: EdgeInsets.all(10),
      child: GradientCard(
        gradient: Gradients.coldLinear,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Le tue finanze:",
                  style: Fonts.title,
                ),
                Container(
                  child: Text(
                    counter.toString() + " €",
                    style: Fonts.numberBig,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
