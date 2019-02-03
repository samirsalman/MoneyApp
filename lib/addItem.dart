import 'package:flutter/material.dart';
import 'package:startup/Fonts.dart';
import 'package:startup/item.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
  List<IconData> icons;
  List<Item> items;
  int index;
  AddItem(this.icons, this.items, this.index);
}

class _AddItemState extends State<AddItem> {
  double _valueInt = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 5,
          title: Text(
            "Aggiungi Spesa",
            style: Fonts.paragraphBlack,
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 450,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          widget.icons[widget.index],
                          size: 50,
                        ),
                        Text(
                          widget.items[widget.index].name,
                          style: Fonts.paragraphBlack,
                        )
                      ],
                    ),
                    _note(),
                    _price(),
                    _button(),
                  ],
                ),
                margin: EdgeInsets.all(10),
                elevation: 5,
              ),
            )
          ],
        ));
  }

  Widget _price() {
    return Container(
      width: 250,
      margin: EdgeInsets.only(top: 30),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.euro_symbol),
            labelText: "Prezzo",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.orange,
                ))),
        style: Fonts.numberBlackSmall,
      ),
    );
  }

  Widget _button() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: ButtonBar(

        alignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            color: Colors.orange,
              onPressed: (){
              //Save data
              Navigator.pop(context);
              },
              child: Text(
                "Aggiungi",
                style: Fonts.numberBlackSmall,
              )),FlatButton(
            color: Colors.orange,
              onPressed: (){
              //do nothing
                Navigator.pop(context);
              },
              child: Text(
                "Annulla",
                style: Fonts.numberBlackSmall,
              )),
        ],
      ),
    );
  }

  Widget _note() {
    return Container(
      width: 250,
      margin: EdgeInsets.only(top: 30),
      child: TextField(
        maxLines: 4,
        decoration: InputDecoration(
            labelText: "Note",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.orange,
                ))),
        style: Fonts.paragraphBlack,
      ),
    );
  }
}
