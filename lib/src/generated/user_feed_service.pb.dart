//
//  Generated code. Do not modify.
//  source: user_feed_service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GetUserAdsRequest extends $pb.GeneratedMessage {
  factory GetUserAdsRequest({
    $core.int? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetUserAdsRequest._() : super();
  factory GetUserAdsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserAdsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserAdsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserAdsRequest clone() => GetUserAdsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserAdsRequest copyWith(void Function(GetUserAdsRequest) updates) => super.copyWith((message) => updates(message as GetUserAdsRequest)) as GetUserAdsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserAdsRequest create() => GetUserAdsRequest._();
  GetUserAdsRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserAdsRequest> createRepeated() => $pb.PbList<GetUserAdsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserAdsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserAdsRequest>(create);
  static GetUserAdsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class GetUserAdsResponse extends $pb.GeneratedMessage {
  factory GetUserAdsResponse({
    $core.Iterable<Ad>? ads,
  }) {
    final $result = create();
    if (ads != null) {
      $result.ads.addAll(ads);
    }
    return $result;
  }
  GetUserAdsResponse._() : super();
  factory GetUserAdsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserAdsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserAdsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<Ad>(1, _omitFieldNames ? '' : 'ads', $pb.PbFieldType.PM, subBuilder: Ad.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserAdsResponse clone() => GetUserAdsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserAdsResponse copyWith(void Function(GetUserAdsResponse) updates) => super.copyWith((message) => updates(message as GetUserAdsResponse)) as GetUserAdsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserAdsResponse create() => GetUserAdsResponse._();
  GetUserAdsResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserAdsResponse> createRepeated() => $pb.PbList<GetUserAdsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserAdsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserAdsResponse>(create);
  static GetUserAdsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Ad> get ads => $_getList(0);
}

class Ad extends $pb.GeneratedMessage {
  factory Ad({
    $core.String? storeName,
    $core.String? storeAddress,
    $core.Iterable<AdItemData>? adItems,
  }) {
    final $result = create();
    if (storeName != null) {
      $result.storeName = storeName;
    }
    if (storeAddress != null) {
      $result.storeAddress = storeAddress;
    }
    if (adItems != null) {
      $result.adItems.addAll(adItems);
    }
    return $result;
  }
  Ad._() : super();
  factory Ad.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ad.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Ad', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeName')
    ..aOS(2, _omitFieldNames ? '' : 'storeAddress')
    ..pc<AdItemData>(3, _omitFieldNames ? '' : 'adItems', $pb.PbFieldType.PM, subBuilder: AdItemData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ad clone() => Ad()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ad copyWith(void Function(Ad) updates) => super.copyWith((message) => updates(message as Ad)) as Ad;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Ad create() => Ad._();
  Ad createEmptyInstance() => create();
  static $pb.PbList<Ad> createRepeated() => $pb.PbList<Ad>();
  @$core.pragma('dart2js:noInline')
  static Ad getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ad>(create);
  static Ad? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeName => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStoreName() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get storeAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStoreAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreAddress() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<AdItemData> get adItems => $_getList(2);
}

class AdItemData extends $pb.GeneratedMessage {
  factory AdItemData({
    $core.String? ingredient,
    $core.String? name,
    $core.double? price,
    $core.String? sale,
    $core.String? ingredientType,
  }) {
    final $result = create();
    if (ingredient != null) {
      $result.ingredient = ingredient;
    }
    if (name != null) {
      $result.name = name;
    }
    if (price != null) {
      $result.price = price;
    }
    if (sale != null) {
      $result.sale = sale;
    }
    if (ingredientType != null) {
      $result.ingredientType = ingredientType;
    }
    return $result;
  }
  AdItemData._() : super();
  factory AdItemData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdItemData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AdItemData', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ingredient')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'price', $pb.PbFieldType.OF)
    ..aOS(4, _omitFieldNames ? '' : 'sale')
    ..aOS(5, _omitFieldNames ? '' : 'ingredientType')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AdItemData clone() => AdItemData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AdItemData copyWith(void Function(AdItemData) updates) => super.copyWith((message) => updates(message as AdItemData)) as AdItemData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdItemData create() => AdItemData._();
  AdItemData createEmptyInstance() => create();
  static $pb.PbList<AdItemData> createRepeated() => $pb.PbList<AdItemData>();
  @$core.pragma('dart2js:noInline')
  static AdItemData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdItemData>(create);
  static AdItemData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ingredient => $_getSZ(0);
  @$pb.TagNumber(1)
  set ingredient($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIngredient() => $_has(0);
  @$pb.TagNumber(1)
  void clearIngredient() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get price => $_getN(2);
  @$pb.TagNumber(3)
  set price($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get sale => $_getSZ(3);
  @$pb.TagNumber(4)
  set sale($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSale() => $_has(3);
  @$pb.TagNumber(4)
  void clearSale() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get ingredientType => $_getSZ(4);
  @$pb.TagNumber(5)
  set ingredientType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIngredientType() => $_has(4);
  @$pb.TagNumber(5)
  void clearIngredientType() => $_clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
