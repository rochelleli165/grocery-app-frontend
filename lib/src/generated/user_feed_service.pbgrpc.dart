//
//  Generated code. Do not modify.
//  source: user_feed_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user_feed_service.pb.dart' as $0;

export 'user_feed_service.pb.dart';

@$pb.GrpcServiceName('pb.UserFeedService')
class UserFeedServiceClient extends $grpc.Client {
  static final _$getUserAds = $grpc.ClientMethod<$0.GetUserAdsRequest, $0.GetUserAdsResponse>(
      '/pb.UserFeedService/GetUserAds',
      ($0.GetUserAdsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUserAdsResponse.fromBuffer(value));

  UserFeedServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetUserAdsResponse> getUserAds($0.GetUserAdsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserAds, request, options: options);
  }
}

@$pb.GrpcServiceName('pb.UserFeedService')
abstract class UserFeedServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.UserFeedService';

  UserFeedServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUserAdsRequest, $0.GetUserAdsResponse>(
        'GetUserAds',
        getUserAds_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserAdsRequest.fromBuffer(value),
        ($0.GetUserAdsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetUserAdsResponse> getUserAds_Pre($grpc.ServiceCall $call, $async.Future<$0.GetUserAdsRequest> $request) async {
    return getUserAds($call, await $request);
  }

  $async.Future<$0.GetUserAdsResponse> getUserAds($grpc.ServiceCall call, $0.GetUserAdsRequest request);
}
