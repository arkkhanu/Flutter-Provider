import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Model with ChangeNotifier {
  bool _isToogle = false;

  get getisToogle => _isToogle;

  void setisToogle(bool _val) {
    _isToogle = _val;
    notifyListeners();

  }

  Widget showSomeText(BuildContext context_) {
    print("Inner class value is " + getisToogle.toString());
    return Consumer<Model>(builder: (context_, model, _) {
      print("Most inner");
      return Text("Your value is " + model.getisToogle.toString());
    });
  }

  Widget showSwitch(BuildContext context_) {
    print("Inner class value is " + getisToogle.toString());
    return Consumer<Model>(builder: (context_, model, _) {
      print("Most inner");
      return Switch(
          value: model.getisToogle,
          onChanged: (val) {
            model.setisToogle(val);
          });
    }); // return Text("Your value is "+ model.getisToogle.toString());});
  }



   showAction() {
    return Builder(builder: (BuildContext context) {
      return RaisedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => StatefulBuilder(builder: (builder,setstate){
                return AlertDialog(
                  title: Text("Hello"),
                  content: Switch(
                      value: context.read<Model>().getisToogle,
                      onChanged: (val) {
                        setstate((){
                          context.read<Model>().setisToogle(val);
                        });

                        // model.setisToogle(val);
                      }),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(_),
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(_),
                      child: Text("Ok"),
                    )
                  ],
                );
              }));
        },
        child: Text("Show Dialog"),
      );
    });
  }
}
