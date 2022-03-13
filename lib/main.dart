// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quotes_app/widgets/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuoteApp(),
    );
  }
}

class QuoteApp extends StatefulWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  State<QuoteApp> createState() => _QuoteAppState();
}

// class for card-quote(title, author)
class BestQuotes {
  String title;
  String author;

  BestQuotes({
    required this.author,
    required this.title,
  });
}

class _QuoteAppState extends State<QuoteApp> {
  // list of all quotes
  List allQuotes = [
    BestQuotes(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(
        author: "Ali 7assan", title: "العقل السليم في البعد عن الحريم 😂"),
    BestQuotes(
        author: "Ali Elrayek",
        title: "كُتر التفكير فى الى ضااااع هيعمل لك فى دماغك صادااااع  😉 "),
    BestQuotes(
        author: "ELRAYEK",
        title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
  ];

// To delete card-quote when clicking on delete icon
  delete(BestQuotes item) {
    setState(() {
      allQuotes.remove(item);
    });
  }

// create 2 controllers to get the text from the textfield
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

// To add new card-quote to the main screen when clicking on "ADD" in showModalBottomSheet
  addNewQuote() {
    setState(() {
      allQuotes.add(
        BestQuotes(author: myController2.text, title: myController1.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(27),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                          controller: myController1,
                          maxLength: 20,
                          decoration:
                              InputDecoration(hintText: "Add new quote")),
                      SizedBox(
                        height: 22,
                      ),
                      TextField(
                          controller: myController2,
                          maxLength: 20,
                          decoration: InputDecoration(hintText: "Add author")),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            addNewQuote();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
                          ))
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          "Best Quotes",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: allQuotes
              .map((item) => CardWidget(
                    // To pass the delete function to "card.dart" file
                    delete: delete,
                    // To pass the item inside the list to "card.dart" file
                    item: item,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
