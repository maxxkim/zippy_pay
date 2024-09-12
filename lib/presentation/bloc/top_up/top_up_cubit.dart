import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy/presentation/bloc/top_up/top_up_state.dart';

class TopUpCubit extends Cubit<TopUpState> {
  TopUpCubit() : super(TopUpState());

  Future<void> callPayIn({
    required String merchantId,
    required String transactionId,
    required String country,
    required String currency,
    required String payMethod,
    required String documentId,
    required double amount,
    required String email,
    required String name,
    required int timestamp,
    required int payinExpirationTime,
    required String urlOK,
    required String urlError,
    required Map<String, dynamic> objData,
  }) async {
    try {
      final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('payIn');
      
      final response = await callable.call(<String, dynamic>{
        'merchantId': merchantId,
        'transactionId': transactionId,
        'country': country,
        'currency': currency,
        'payMethod': payMethod,
        'documentId': documentId,
        'amount': amount,
        'email': email,
        'name': name,
        'timestamp': timestamp,
        'payinExpirationTime': payinExpirationTime,
        'url_OK': urlOK,
        'url_ERROR': urlError,
        'objData': objData,
      });

      emit(TopUpState(message: "Transaction successful: ${response.data}", isSuccess: true));
    } catch (e) {
      emit(TopUpState(message: "Error calling payIn: $e", isSuccess: false));
    }
  }
}