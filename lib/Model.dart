


import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

 class Model with ChangeNotifier{

  bool _isToogle = false;

  get getisToogle => _isToogle;

   void setisToogle(bool _val){
    _isToogle = _val;
    notifyListeners();
  }


  Widget showSomeText(BuildContext context_){
   print("Inner class value is "+ getisToogle.toString());
   return Consumer<Model>(builder: (context_,model,_){
     print("Most inner");
     return Text("Your value is "+ model.getisToogle.toString());});
  }

}