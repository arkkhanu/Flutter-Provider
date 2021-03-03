import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterprovider/Model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("h1");
    return ChangeNotifierProvider<Model>(

      create:  (context)=>Model(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Provider"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              MySpecialHeading(),
              MySpecialContent(),
              Model().showSomeText(context)
            ],
          ),
        ),
        floatingActionButton: MyFloatingActionButtion(),
      ),
    );
  }
}

class MySpecialHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("h2");
    var rng = new Random();
    int asd = rng.nextInt(100);
    // var model = Provider.of<Model>(context);
    print("Random :"+asd.toString());
    return Padding(
      padding: EdgeInsets.all(8.0),
      // child: Text("Hello bool "+model.getisToogle.toString()),
      // child: Text("Hello bool "+asd.toString()),
      child: Consumer<Model>(builder:(contex,model,_){
        print("now inner");
        print("Random2 :"+asd.toString());
        return Text("Hello bool "+asd.toString());}),
    );
  }
}

class MySpecialContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("h3");
    // var model = Provider.of<Model>(context);
    return Padding(
      padding: EdgeInsets.all(8.0),
      // child:  Text("Hello bool "+model.getisToogle.toString())
      child: Consumer<Model>(builder:(context,model,_){
        print("inner h3");
      return  Text("Hello bool "+model.getisToogle.toString());}),
    );
  }
}

class MyFloatingActionButtion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Model>(context);
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: (){

        if(model.getisToogle == false){
          model.setisToogle(true);
        }else{
          model.setisToogle(false);

        }

        print("print : "+model.getisToogle.toString());

      },
      tooltip: 'Change type',
      child: Icon(Icons.change_history),
    );
  }
}
