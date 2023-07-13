import 'dart:convert';
import 'dart:io';

import 'package:flutter/Material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

addHttpCertification() async {
  ByteData data = await PlatformAssetBundle().load('assets/ca/httpCertificate.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
}


// Future<ResponseModel> requestData(BuildContext context, String request,
//     {ResponseType responseType = ResponseType.GET, Map<String, dynamic>? params, Map<String, String>? headers, String? jsonBody, bool auth = false}) async {
//   ResponseModel response = ResponseModel();
//   response.statusCode = 500;
//
//   try {
//     Uri url = Uri.parse(request);
//
//     Map<String, String> requestHeaders = {};
//     String body = "";
//
//     Map<String, dynamic> requestBody = {};
//
//     if (headers != null) {
//       requestHeaders.addAll(headers);
//     }
//
//     if (params != null) {
//       requestBody.addAll(params);
//     } else {
//       if (jsonBody != null) {
//         body = jsonBody;
//       }
//     }
//
//     try {
//       var httpResponse = responseType == ResponseType.POST
//           ? await post(
//               url,
//               body: body.isNotEmpty ? body : requestBody,
//               headers: requestHeaders,
//             )
//           : await get(url, headers: requestHeaders);
//
//       response = ResponseModel.fromJson(jsonDecode(httpResponse.body));
//
//       await checkStatusCode(context, response.statusCode!);
//
//       return response;
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//
//       response.statusCode = 500;
//       response.message = "Something went wrong";
//       return response;
//     }
//   } catch (e) {
//     if (kDebugMode) {
//       print(e);
//     }
//   }
//
//   response.message = "Something went wrong";
//   return response;
// }
//
// Future<void> checkStatusCode(BuildContext context, int statusCode) async {
//   if (statusCode == 401) {
//     await UserHandler().deleteUserDataFile();
//
//     uShowSnackBar(context, text: "Session expired, please login again");
//
//     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
//   }
// }
