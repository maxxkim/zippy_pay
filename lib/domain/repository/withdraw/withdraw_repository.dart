abstract class WithdrawRepository {
  Future<WithdrawRepository> getWithdraw({
    required String merchantId,
    required String transactionId,
    required String country,
    required String currency,
    required String payMethod,
    required String documentId,
    required String amount,
    required String email,
    required String name,
    required String timestamp,
    String? payinExpirationTime, 
    required String urlOk,
    required String urlError,
    required String objData,
  });
}