import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Description extends StatelessWidget {
  Description({Key? key, required this.title, required this.description})
      : super(key: key);
  final String title, description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("decription"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Material(
          elevation: 30, // Add shadow to the container
          borderRadius: BorderRadius.circular(10),
          child: Container(
            //decoration: BoxDecoration(color: Colors.grey[900]),
            height: 200,
            child: Column(
              children: [
                Material(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
