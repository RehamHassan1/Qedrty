import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  var email = TextEditingController();
  var name = TextEditingController();
  var address = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();

  registerUser({required email, required password}) async {
    try {
      emit(RegisterLoading());
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);

      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errmassage: 'weak password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(
            errmassage: 'The account already exist for that email.'));
      }
    } catch (e) {
      emit(RegisterFailure(errmassage: 'There went an error'));
    }
  }
}
