import 'package:flutter/material.dart';

class Mapee extends StatefulWidget {
  @override
  _MapeeState createState() => _MapeeState();
}

class _MapeeState extends State<Mapee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mappe"),
      ),
      body: Center(
        child: Container(
          child: Text("Mappee"),
        ),
      ),
    );
  }
}
