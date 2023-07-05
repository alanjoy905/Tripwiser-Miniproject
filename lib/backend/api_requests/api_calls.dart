import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Backendflow - emailBookInfoToOwner Group Code

class BackendflowEmailBookInfoToOwnerGroup {
  static String baseUrl = 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static EmailBookInfoToOwnerCall emailBookInfoToOwnerCall =
      EmailBookInfoToOwnerCall();
}

class EmailBookInfoToOwnerCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? attachmentLink = '',
    String? attachmentName = '',
    String? name = '',
    String? selectedRoomsCount = '',
    String? email = '',
    String? phoneNumber = '',
  }) {
    final body = '''
{
  "sk-bf-ee6000d7-b50f-4e28-a722-2a5f380cde95": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailBookInfoToOwner',
      apiUrl:
          '${BackendflowEmailBookInfoToOwnerGroup.baseUrl}/email?templateId=jTjhFu0MxZmQfgxqZS3p&to=${to}&subject=${subject}&attachmentLink=${attachmentLink}&attachmentName=${attachmentName}&name=${name}&SelectedRoomsCount=${selectedRoomsCount}&email=${email}&phone_number=${phoneNumber}',
      callType: ApiCallType.POST,
      headers: {
        ...BackendflowEmailBookInfoToOwnerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: false,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Backendflow - emailBookInfoToOwner Group Code

/// Start Backendflow - emailBookSuccessEmail Group Code

class BackendflowEmailBookSuccessEmailGroup {
  static String baseUrl = 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static EmailBookSuccessEmailCall emailBookSuccessEmailCall =
      EmailBookSuccessEmailCall();
}

class EmailBookSuccessEmailCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? attachmentLink = '',
    String? attachmentName = '',
    String? name = '',
  }) {
    final body = '''
{
  "sk-bf-ee6000d7-b50f-4e28-a722-2a5f380cde95": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailBookSuccessEmail',
      apiUrl:
          '${BackendflowEmailBookSuccessEmailGroup.baseUrl}/email?templateId=3kNSr1t1hiPlOEjnN0yb&to=${to}&subject=${subject}&attachmentLink=${attachmentLink}&attachmentName=${attachmentName}&name=${name}',
      callType: ApiCallType.POST,
      headers: {
        ...BackendflowEmailBookSuccessEmailGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: false,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Backendflow - emailBookSuccessEmail Group Code

/// Start Backendflow - emailOwnerResponse Group Code

class BackendflowEmailOwnerResponseGroup {
  static String baseUrl = 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static EmailOwnerResponseCall emailOwnerResponseCall =
      EmailOwnerResponseCall();
}

class EmailOwnerResponseCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? attachmentLink = '',
    String? attachmentName = '',
    String? name = '',
  }) {
    final body = '''
{
  "sk-bf-ee6000d7-b50f-4e28-a722-2a5f380cde95": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailOwnerResponse',
      apiUrl:
          '${BackendflowEmailOwnerResponseGroup.baseUrl}/email?templateId=7mptuQpKBtMltcqzVmdM&to=${to}&subject=${subject}&attachmentLink=${attachmentLink}&attachmentName=${attachmentName}&name=${name}',
      callType: ApiCallType.POST,
      headers: {
        ...BackendflowEmailOwnerResponseGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: false,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Backendflow - emailOwnerResponse Group Code

/// Start Backendflow - emailOwnerVerifiedEmail Group Code

class BackendflowEmailOwnerVerifiedEmailGroup {
  static String baseUrl = 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static EmailOwnerVerifiedEmailCall emailOwnerVerifiedEmailCall =
      EmailOwnerVerifiedEmailCall();
}

class EmailOwnerVerifiedEmailCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? attachmentLink = '',
    String? attachmentName = '',
    String? name = '',
  }) {
    final body = '''
{
  "sk-bf-ee6000d7-b50f-4e28-a722-2a5f380cde95": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emailOwnerVerifiedEmail',
      apiUrl:
          '${BackendflowEmailOwnerVerifiedEmailGroup.baseUrl}/email?templateId=eW7XWYePhHIUajHl2AW6&to=${to}&subject=${subject}&attachmentLink=${attachmentLink}&attachmentName=${attachmentName}&name=${name}',
      callType: ApiCallType.POST,
      headers: {
        ...BackendflowEmailOwnerVerifiedEmailGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: false,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Backendflow - emailOwnerVerifiedEmail Group Code

/// Start Backendflow - pdfgenBookedSuccessfully Group Code

class BackendflowPdfgenBookedSuccessfullyGroup {
  static String baseUrl = 'https://api.backendflow.io/v1';
  static Map<String, String> headers = {};
  static PdfgenBookedSuccessfullyCall pdfgenBookedSuccessfullyCall =
      PdfgenBookedSuccessfullyCall();
}

class PdfgenBookedSuccessfullyCall {
  Future<ApiCallResponse> call({
    String? hotelServiceName = '',
    String? name = '',
    String? selectedRoomsCount = '',
    String? rateperday = '',
  }) {
    final body = '''
{
  "sk-bf-ee6000d7-b50f-4e28-a722-2a5f380cde95": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'pdfgenBookedSuccessfully',
      apiUrl:
          '${BackendflowPdfgenBookedSuccessfullyGroup.baseUrl}/pdfgen?templateId=qTVA0wpVjZ9r5DUo9RXt&HotelServiceName=${hotelServiceName}&name=${name}&SelectedRoomsCount=${selectedRoomsCount}&Rateperday=${rateperday}',
      callType: ApiCallType.POST,
      headers: {
        ...BackendflowPdfgenBookedSuccessfullyGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: false,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Backendflow - pdfgenBookedSuccessfully Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
