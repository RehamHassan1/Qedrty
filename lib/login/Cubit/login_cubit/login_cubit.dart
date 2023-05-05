import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../componant/com.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> loginUser({required email, required password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // showsnackBar(context, 'No user found for that email.');
        emit(LoginFailure(errmassage:  'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
                emit(LoginFailure(errmassage: 'Wrong password provided for that user.'));

        //showsnackBar(context, 'Wrong password provided for that user.');
      }
    } catch (e) {
      emit(LoginFailure(errmassage: 'There went an error'));
    }
  }
}
