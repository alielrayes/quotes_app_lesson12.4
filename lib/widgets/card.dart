// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../main.dart';

class CardWidget extends StatelessWidget {
  final Function delete;
  final BestQuotes item;

  const CardWidget({Key? key, required this.item, required this.delete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Color.fromARGB(255, 57, 66, 151),
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              
              item.title,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    delete(item);
                  },
                  icon: Icon(Icons.delete),
                  color: Color.fromARGB(255, 255, 217, 217),
                  iconSize: 26,
                ),
                Text(
                  item.author,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
