import 'package:flutter/material.dart';

import '../utils/Hepler/dataBaseHepler.dart'; // Adjust the import path according to your project structure

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    items = await DatabaseHelper.databaseHelper.fetchAllItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
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
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    TextFormField(
                      controller: priceController,
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
                    onPressed: () async {
                      await DatabaseHelper.databaseHelper.insertItem(
                        name: nameController.text,
                        price: priceController.text,
                      );
                      nameController.clear();
                      priceController.clear();
                      await fetchItems();
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
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(item['id'].toString()),
            ),
            title: Text(item['name']),
            subtitle: Text("Price: \$${item['price']}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await DatabaseHelper.databaseHelper.deleteItem(id: item['id']);
                await fetchItems();
              },
            ),
          );
        },
      ),
    );
  }
}
