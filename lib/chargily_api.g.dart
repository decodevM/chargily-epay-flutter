// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chargily_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargilyResponse _$ChargilyResponseFromJson(Map<String, dynamic> json) =>
    ChargilyResponse(
      checkoutUrl: json['checkout_url'] as String?,
    );

Map<String, dynamic> _$ChargilyResponseToJson(ChargilyResponse instance) =>
    <String, dynamic>{
      'checkout_url': instance.checkoutUrl,
    };

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      client: json['client'] as String?,
      clientEmail: json['client_email'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      backUrl: json['back_url'] as String?,
      webhookUrl: json['webhook_url'] as String?,
      mode: $enumDecodeNullable(_$PaymentMethodEnumMap, json['mode']),
      invoiceNumber: json['invoice_number'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'client': instance.client,
      'client_email': instance.clientEmail,
      'invoice_number': instance.invoiceNumber,
      'discount': instance.discount,
      'amount': instance.amount,
      'back_url': instance.backUrl,
      'webhook_url': instance.webhookUrl,
      'mode': _$PaymentMethodEnumMap[instance.mode],
      'comment': instance.comment,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.EDAHABIA: 'EDAHABIA',
  PaymentMethod.CIB: 'CIB',
};

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) =>
    PaymentResponse(
      json['isSuccessful'] as bool,
      json['body'],
    );

Map<String, dynamic> _$PaymentResponseToJson(PaymentResponse instance) =>
    <String, dynamic>{
      'isSuccessful': instance.isSuccessful,
      'body': instance.body,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _ChargilyApiClient implements ChargilyApiClient {
  _ChargilyApiClient(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'https://epay.chargily.com.dz';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ChargilyResponse> createInvoice(
    dynamic apiKey,
    Invoice invoice,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Accept': 'application/json',
      r'X-Authorization': apiKey,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ChargilyResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/api/invoice',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ChargilyResponse _value;
    try {
      _value = ChargilyResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
