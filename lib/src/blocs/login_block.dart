import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:formu_val/src/blocs/validation.dart';

class LoginBloc with Validation {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  //Eran StreamController<String>.broadcast()

  //Recuperar los datos de Stream
  Stream<String> get emailStream => _emailController.stream.transform(valEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(valPassword);

  Stream<bool> get formValiStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  //Insertar datos del Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

//Obtener el ultimo valor ingresado a los Streams
  get email => _emailController.valueOrNull;
  get password => _passwordController.valueOrNull;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
