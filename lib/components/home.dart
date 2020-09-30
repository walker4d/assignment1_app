import 'package:flutter/material.dart';
import 'about.dart';
import 'shopping.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String task;
  final List<Shopping> shoppingList = <Shopping>[];
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  final myController = TextEditingController();
  void _incrementCounter() {}

  void add_to_Cart(String text) {
    setState(() {
      if (text != "") {
        Shopping item = new Shopping();
        item.item = text;
        item.completed = false;
        shoppingList.add(item);
      }
    });
  }

  void check(int index, bool value) {
    setState(() {
      shoppingList[index].completed = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFF151026),
        title: new Text(
          "My Supermarket Shopping List",
          style: TextStyle(fontSize: 16.0),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
          ),
        ],
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new Container(
              child: TextFormField(
                  decoration: InputDecoration(labelText: 'Enter A list '),
                  controller: myController),
            ),
            new Container(
              child: FlatButton(
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Color(0xFF151026),
                  textColor: Colors.white,
                  onPressed: () => {add_to_Cart(myController.text)}),
            ),
            Expanded(child: listy(context, shoppingList))

            // _myListView(context, entries),
          ],
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://vignette.wikia.nocookie.net/yahari/images/5/5d/Hachiman.png/revision/latest?cb=20180928155052")),
            title: Text("Brian Walker"),
            subtitle: Text("brianwalker4d@gmail.com"),
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About(title: 'About')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.grid_on),
            title: Text('Second Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
          ),
          // ListTile(leading: Icon(Icons.contacts), title: Text("Contact Us")),
        ],
      )),
    );
  }

  Widget listy(BuildContext context, List<Shopping> vale) {
    return Scaffold(
      body: vale.length > 0
          ? ListView.builder(
              itemCount: vale.length,
              itemBuilder: (BuildContext context, int index) {
                if (vale[index].completed == false) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        CheckboxListTile(
                          title: Text(
                            vale[index].item,
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.redAccent,
                                fontStyle: FontStyle.italic),
                          ),
                          value: vale[index].completed,
                          onChanged: (bool value) {
                            check(index, vale[index].completed);
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        CheckboxListTile(
                          title: Text(
                            vale[index].item,
                            style: TextStyle(
                                fontSize: 22.0,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.redAccent,
                                fontStyle: FontStyle.italic),
                          ),
                          value: vale[index].completed,
                          onChanged: (bool value) {
                            check(index, vale[index].completed);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
            )
          : Center(child: const Text('No items')),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
