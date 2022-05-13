import 'package:flutter/material.dart';
import 'package:formu_val/src/blocs/login_block.dart';
export 'package:formu_val/src/blocs/login_block.dart';

class Provider extends InheritedWidget{
  static Provider? _instancia;

  factory Provider({Key? key, required Widget child}){
   final instancia= _instancia ??= Provider._internal(key:key ,child:child);
      return instancia;
  }
  Provider._internal({Key? key, required Widget child})
   : super(key: key, child:child);


   

   final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.loginBloc;  }
}