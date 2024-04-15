import 'package:ecommerce_app/ActionListener/MyAction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/themeprovider.dart';
import '../widgets/ThemeDataStyle.dart';

class Actionlistenerpage extends StatefulWidget {
  const Actionlistenerpage({super.key});

  @override
  State<Actionlistenerpage> createState() => _ActionlistenerpageState();
}

class _ActionlistenerpageState extends State<Actionlistenerpage> {
  bool _toggleAction = false;
   final MyAction _myAction = MyAction();
   bool _switchcheck = false;
   var  textvalue = 'switch off';



   @override
   void initState(){
     super.initState();
   }
   void switchcheck(bool value){
     if(_switchcheck == false){
       setState(() {
         _switchcheck = true;
         textvalue = 'switch button ON';
       });
     }
     else{
       setState(() {
         _switchcheck = false;
         textvalue = 'Switch Button is OFF';
       });
     }
   }

   void toggleButton(){
     setState(() {
       _toggleAction = !_toggleAction;
     });
   }
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<themeProvider>(context);
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: OutlinedButton(
              onPressed:() => toggleButton(),
              child: Text(_toggleAction ? 'DisableAction' :'EnabledAction' )
                ),
            ),
            if(_toggleAction)
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: ActionListener(
                  listener: (Action<Intent> action) {
                    if(action.intentType == MyIntent){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Action Listener Called'),
                      ));

                    }
                  }, action: _myAction,
                  child: ElevatedButton(
                  onPressed:() =>
                      const ActionDispatcher().invokeAction( _myAction,const MyIntent()),
                    child: const Text('call the action listener'),
                ),),
              ),
            if (!_toggleAction) Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue[50],
              child: const Align(
               // alignment: FractionalOffset(0.2, 0.6),
                alignment: Alignment.center,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            Tooltip(
              height: 35,
              message: 'My Account',
              textStyle: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.green),
              waitDuration: const Duration(seconds: 1),
              showDuration:const Duration(seconds: 10) ,
                child: IconButton(onPressed: (){},
                    icon: const Icon(Icons.account_box, size: 100,))),
            Switch(value: _switchcheck, onChanged: switchcheck,
              activeColor: Colors.blue,
              activeTrackColor: Colors.yellow,
              inactiveThumbColor: Colors.redAccent,
              inactiveTrackColor: Colors.grey,  ),
            Text(textvalue, style: const TextStyle(color:Colors.black54),),
            Transform.scale(
              scale: 1.4,
              child: Switch(
                value: themeprovider.themeDataStyle == ThemeDataStyle.dark
                    ? true
                    : false,
                onChanged: (isOn) {
                  themeprovider.changeTheme();
                },
              ),
            ),
          ],
        ),

      ),
    );
  }
}
