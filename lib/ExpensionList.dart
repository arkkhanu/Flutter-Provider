import 'package:flutter/material.dart';

import 'Mappe.dart';

class ExpensionList extends StatefulWidget {
  @override
  _ExpensionListState createState() => _ExpensionListState();
}

class _ExpensionListState extends State<ExpensionList> {
  String _name ="";
  bool _expen = false;
  GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expension List"),
      ),
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Text("Hello1"),
            Text("Hello2"),
            Text("Hello3"),
            Text("Hello4"),
            Text("Hello5"),
            Text("Hello6"),
            Card(
              child: ExpansionTile(
              onExpansionChanged: (val){
                _expen = val;
                print("val"+val.toString());
              },
                title: Text("Hello7"),
                trailing: Icon(Icons.plus_one),
                children: [
                  ListTile(
                    title: TextFormField(
                      onChanged: (val) {
                        _name = val;
                      },
                      onSaved: ( val){
                        _name = val!;
                      },
                      validator: (_val){
                        return _val == null || _val.isEmpty ? "Email is required" : null;
                      },
                    ),
                    leading: Icon(Icons.access_alarm),
                    trailing: Text("bo"),
                  ),
                  ListTile(
                    title: Text("ark"),
                    leading: Icon(Icons.access_alarm),
                    trailing: Text("bo"),
                  ),
                  ListTile(
                    title: Text("ark"),
                    leading: Icon(Icons.access_alarm),
                    trailing: Text("bo"),
                  ),
                  ListTile(
                    title: Text("ark"),
                    leading: Icon(Icons.access_alarm),
                    trailing: Text("bo"),
                  )
                ],
              ),
            )
            ,
            TextButton(onPressed: (){
              if(_expen && _globalKey.currentState!.validate()){
                _globalKey.currentState!.save();
                print("The text Value:"+ _name);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Mapee()));
              }

            }, child: Text("Move")),
            TextButton(onPressed: (){
              if(_globalKey.currentState!.validate()){
                _globalKey.currentState!.save();
                print("The text Value:"+ _name);
              }

            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
