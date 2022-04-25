import 'package:firebase_signin/NetWork/network_enum.dart';

typedef NetworkCallBack<R> = R Function(dynamic);

typedef NetworkOnFailureCallBackWithMesasge<R> = R Function(
    NetworkResponseErrorType, String?);
