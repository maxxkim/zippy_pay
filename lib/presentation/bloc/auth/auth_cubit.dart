import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth;
  String? _verificationId = "0000"; // Храним verificationId

  AuthCubit(this._firebaseAuth) : super(AuthInitial());

  Future<void> loginWithPhone(String phoneNumber) async {
    try {
      emit(AuthLoading());
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
          print('++++');
        },
        verificationFailed: (FirebaseAuthException e) {
          print('1111');
          emit(AuthFailure(e.message));
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId; // Сохраняем verificationId
          print('0000');
          emit(AuthCodeSent(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print('2222');
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> verifyCode(String smsCode) async {
    print(1);
  /*
    if (_verificationId == null) {
      print('bad');
      emit(AuthFailure("Verification ID is missing."));
      return;
    }

    try {
      emit(AuthLoading());
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );

      await _firebaseAuth.signInWithCredential(credential);
      print('good');
      emit(AuthSuccess());
    } catch (e) {
      print('fail ${e.toString()}');
      emit(AuthFailure(e.toString()));
    }
 */
  }
}





