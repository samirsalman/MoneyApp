import 'dart:convert';
import 'item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:startup/Fonts.dart';
import 'package:startup/addItem.dart';

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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddItem(icons, items, index)));
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
          title: Text(
            "Categoria spesa",
            style: Fonts.paragraphBlack,
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
