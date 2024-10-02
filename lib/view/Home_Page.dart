import 'package:af_final_exam/utils/Hepler/data_hepler.dart';
import 'package:flutter/material.dart';

import '../utils/Hepler/dataBaseHepler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseHelper.databaseHelper.initDataBase();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController price = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(
            onPressed: () {
              DatabaseHelper.databaseHelper.insertitem(
                name: name.text,
                price: price.text,
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Enter Details'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    TextFormField(
                      controller: price,
                      decoration: InputDecoration(labelText: 'Price'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Data.data.addItem(name: name.text, price: price.text);
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, Index) {
          return Column(
            children: [
              SizedBox(
                height: 200,
                child: ListTile(
                  // leading: Text("${Index}"),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  title: Text("1"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
