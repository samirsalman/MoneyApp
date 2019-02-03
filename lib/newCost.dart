import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:startup/Fonts.dart';

class NuovaSpesa extends StatefulWidget {
  @override
  _NuovaSpesaState createState() => _NuovaSpesaState();
}

class _NuovaSpesaState extends State<NuovaSpesa> {
  List<Item> items = List();
  List<IconData> icons = [
    Icons.fastfood,
    Icons.videogame_asset,
    Icons.home,
    Icons.shopping_cart,
    Icons.home,
    Icons.attach_money,
    Icons.airplanemode_active
  ];

  void _dialogCost(String name, int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            title: Text(
              "Aggiungi spesa",
              style: Fonts.numberBlackSmall,
            ),
            content: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 250),
              child: ListView(
                children: <Widget>[
                  Row(
                    children: <Widget>[Icon(icons[index]), Text(name)],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Note",
                    ),
                    style: Fonts.paragraphBlack,
                    maxLines: 1,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "€",
                            style: Fonts.numberBlack,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: Fonts.numberBlackSmall,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                        width: 3))),
                          ),
                          width: 90,
                        ),
                        Container(

                          margin: EdgeInsets.only(top: 40),
                          child: Text(
                            ",",
                            style: Fonts.numberBlack,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: Fonts.numberBlackSmall,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                        width: 3))),
                          ),
                          width: 90,
                        ),
                      ])
                ],
              ),
            ),
            actions: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    elevation: 4,
                    color: Colors.orange,
                    child: Text("Aggiungi", style: Fonts.numberBlackSmall),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    elevation: 4,
                    color: Colors.orange,
                    child: Text(
                      "Annulla",
                      style: Fonts.numberBlackSmall,
                    ),
                  )
                ],
              )
            ],
          );
        });
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/item.json');
  }

  Future loadItems() async {
    String jsonString = await loadAsset();
    for (Map map in List.from(json.decode(jsonString))) {
      setState(() {
        items.add(Item.fromJson(map));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadItems();
  }

  Widget _category(String name, int index) {
    return GestureDetector(
        onTap: () {
          _dialogCost(name, index);
        },
        child: Container(
            height: 90,
            margin: EdgeInsets.all(0),
            child: Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(icons[index]),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          name,
                          style: Fonts.paragraphBlack,
                        ),
                      )
                    ],
                  ),
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 5,
          title: new Image.asset(
            "assets/logo.png",
            width: 200,
            height: 50,
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, int index) {
            return _category(items[index].name, index);
          },
          itemCount: items.length,
        ));
  }
}

class Item {
  String name;
  String icon;

  Item(this.name, this.icon);

  Item.fromJson(Map<String, dynamic> json)
      : name = json['tipo'],
        icon = json['icona'];

  Map<String, dynamic> toJson() => {
        'tipo': name,
        'icona': icon,
      };
}
