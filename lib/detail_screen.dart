import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;
  DetailScreen({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        backgroundColor: Color.fromARGB(255, 15, 189, 237),
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDetailRow('ID:', item['_id'], Colors.blue),
                  buildDetailRow('Name:', item['name'], Colors.green),
                  buildDetailRow(
                      'Description:', item['description'], Colors.purple),
                  buildDetailRow(
                      'Created At:', item['createdAt'], Colors.orange),
                  buildDetailRow('Updated At:', item['updatedAt'], Colors.red),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildDetailRow(String title, String content, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: color,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              content,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
