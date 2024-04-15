

import 'package:flutter/cupertino.dart';

class MyAction extends Action<MyIntent>{
 
  
  @override
  void addActionListener(ActionListenerCallback listener){
    super.addActionListener(listener);
    debugPrint('ActionListener was added');
  }

  @override
  void removeActionListener(ActionListenerCallback listener){
    super.removeActionListener(listener);
    debugPrint('ActionListener was removed');
  }

  @override
  void invoke(MyIntent intent) {
    // TODO: implement invoke
   notifyActionListeners();
  }
  
}

class MyIntent extends Intent{
  const MyIntent();
}