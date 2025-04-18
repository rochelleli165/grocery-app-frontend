//
//  Generated code. Do not modify.
//  source: user_feed_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getUserAdsRequestDescriptor instead')
const GetUserAdsRequest$json = {
  '1': 'GetUserAdsRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserAdsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserAdsRequestDescriptor = $convert.base64Decode(
    'ChFHZXRVc2VyQWRzUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgFUgZ1c2VySWQ=');

@$core.Deprecated('Use getUserAdsResponseDescriptor instead')
const GetUserAdsResponse$json = {
  '1': 'GetUserAdsResponse',
  '2': [
    {'1': 'ads', '3': 1, '4': 3, '5': 11, '6': '.pb.Ad', '10': 'ads'},
  ],
};

/// Descriptor for `GetUserAdsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserAdsResponseDescriptor = $convert.base64Decode(
    'ChJHZXRVc2VyQWRzUmVzcG9uc2USGAoDYWRzGAEgAygLMgYucGIuQWRSA2Fkcw==');

@$core.Deprecated('Use adDescriptor instead')
const Ad$json = {
  '1': 'Ad',
  '2': [
    {'1': 'store_name', '3': 1, '4': 1, '5': 9, '10': 'storeName'},
    {'1': 'store_address', '3': 2, '4': 1, '5': 9, '10': 'storeAddress'},
    {'1': 'ad_items', '3': 3, '4': 3, '5': 11, '6': '.pb.AdItemData', '10': 'adItems'},
  ],
};

/// Descriptor for `Ad`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adDescriptor = $convert.base64Decode(
    'CgJBZBIdCgpzdG9yZV9uYW1lGAEgASgJUglzdG9yZU5hbWUSIwoNc3RvcmVfYWRkcmVzcxgCIA'
    'EoCVIMc3RvcmVBZGRyZXNzEikKCGFkX2l0ZW1zGAMgAygLMg4ucGIuQWRJdGVtRGF0YVIHYWRJ'
    'dGVtcw==');

@$core.Deprecated('Use adItemDataDescriptor instead')
const AdItemData$json = {
  '1': 'AdItemData',
  '2': [
    {'1': 'ingredient', '3': 1, '4': 1, '5': 9, '10': 'ingredient'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'price', '3': 3, '4': 1, '5': 2, '9': 0, '10': 'price', '17': true},
    {'1': 'sale', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'sale', '17': true},
    {'1': 'ingredient_type', '3': 5, '4': 1, '5': 9, '10': 'ingredientType'},
  ],
  '8': [
    {'1': '_price'},
    {'1': '_sale'},
  ],
};

/// Descriptor for `AdItemData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adItemDataDescriptor = $convert.base64Decode(
    'CgpBZEl0ZW1EYXRhEh4KCmluZ3JlZGllbnQYASABKAlSCmluZ3JlZGllbnQSEgoEbmFtZRgCIA'
    'EoCVIEbmFtZRIZCgVwcmljZRgDIAEoAkgAUgVwcmljZYgBARIXCgRzYWxlGAQgASgJSAFSBHNh'
    'bGWIAQESJwoPaW5ncmVkaWVudF90eXBlGAUgASgJUg5pbmdyZWRpZW50VHlwZUIICgZfcHJpY2'
    'VCBwoFX3NhbGU=');

