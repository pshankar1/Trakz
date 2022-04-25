class QP {
  const QP._();

  static Map<String, String> apiQP(
          {required String apiUrl,
          required String apiPackage,
          required String apiVersion,
          required String apiResource,
          required String apiKey}) =>
      {
        'apiUrl': apiUrl,
        'apiPackage': apiPackage,
        'apiVersion': apiVersion,
        'apiResource': apiResource,
        'apiKey': apiKey
      };
}
