import 'package:flutter/material.dart';
import 'get_page.dart';
import 'post_page.dart';
import 'put_page.dart';
import 'delete_page.dart';

class MethodSelectionPage extends StatefulWidget {
  @override
  _MethodSelectionPageState createState() => _MethodSelectionPageState();
}

class _MethodSelectionPageState extends State<MethodSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 189, 237),
        title: Text('RESTful API'),
        centerTitle: true,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MethodButton(
                text: 'GET',
                color: Colors.blue,
                icon: Icons.get_app,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetPage()),
                  );
                },
              ),
              SizedBox(height: 20),
              MethodButton(
                text: 'POST',
                color: Colors.green,
                icon: Icons.post_add,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostPage()),
                  );
                },
              ),
              SizedBox(height: 20),
              MethodButton(
                text: 'PUT',
                color: Colors.orange,
                icon: Icons.update,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PutPage()),
                  );
                },
              ),
              SizedBox(height: 20),
              MethodButton(
                text: 'DELETE',
                color: Colors.red,
                icon: Icons.delete,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeletePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MethodButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  MethodButton(
      {required this.text,
      required this.color,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Use backgroundColor instead of primary
        foregroundColor: Color.fromARGB(
            255, 253, 253, 253), // Use foregroundColor instead of onPrimary
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        textStyle: TextStyle(fontSize: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      icon: Icon(icon, size: 28),
      label: Text(text),
      onPressed: onPressed,
    );
  }
}
