import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail_screen.dart';

class GetPage extends StatefulWidget {
  @override
  _GetPageState createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  List<dynamic> _docs = [];

  Future<void> _getGroups() async {
    final response =
        await http.get(Uri.parse('https://demo.resthapi.com/group'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _docs = jsonData['docs'];
      });
    } else {
      print('Failed to load groups');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GET Page'),
        backgroundColor: Color.fromARGB(255, 15, 189, 237),
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _getGroups,
              child: Text('Get Groups'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white, // Button color
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            _docs.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _docs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading: Icon(Icons.group),
                            tileColor: Colors.blue[50],
                            title: Text(
                              _docs[index]['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text('ID: ${_docs[index]['_id']}'),
                                SizedBox(height: 5),
                                Text(
                                    'Description: ${_docs[index]['description']}'),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(item: _docs[index]),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Text('No data available.'),
                  ),
          ],
        ),
      ),
    );
  }
}
