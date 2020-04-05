///
//  Generated code. Do not modify.
//  source: displayer.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Empty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Empty clone() => Empty()..mergeFromMessage(this);
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty _defaultInstance;
}

class Index extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Index', createEmptyInstance: create)
    ..a<$core.int>(1, 'value', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Index._() : super();
  factory Index() => create();
  factory Index.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Index.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Index clone() => Index()..mergeFromMessage(this);
  Index copyWith(void Function(Index) updates) => super.copyWith((message) => updates(message as Index));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Index create() => Index._();
  Index createEmptyInstance() => create();
  static $pb.PbList<Index> createRepeated() => $pb.PbList<Index>();
  @$core.pragma('dart2js:noInline')
  static Index getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Index>(create);
  static Index _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class Slide extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Slide', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'image', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'bin', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'gltf', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Slide._() : super();
  factory Slide() => create();
  factory Slide.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Slide.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Slide clone() => Slide()..mergeFromMessage(this);
  Slide copyWith(void Function(Slide) updates) => super.copyWith((message) => updates(message as Slide));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Slide create() => Slide._();
  Slide createEmptyInstance() => create();
  static $pb.PbList<Slide> createRepeated() => $pb.PbList<Slide>();
  @$core.pragma('dart2js:noInline')
  static Slide getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Slide>(create);
  static Slide _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get image => $_getN(0);
  @$pb.TagNumber(1)
  set image($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get bin => $_getN(1);
  @$pb.TagNumber(2)
  set bin($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBin() => $_has(1);
  @$pb.TagNumber(2)
  void clearBin() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get gltf => $_getN(2);
  @$pb.TagNumber(3)
  set gltf($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGltf() => $_has(2);
  @$pb.TagNumber(3)
  void clearGltf() => clearField(3);
}

class Tutorial extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Tutorial', createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'id', protoName: '_id')
    ..a<$core.int>(3, 'length', $pb.PbFieldType.O3)
    ..pc<Slide>(4, 'slides', $pb.PbFieldType.PM, subBuilder: Slide.create)
    ..hasRequiredFields = false
  ;

  Tutorial._() : super();
  factory Tutorial() => create();
  factory Tutorial.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tutorial.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Tutorial clone() => Tutorial()..mergeFromMessage(this);
  Tutorial copyWith(void Function(Tutorial) updates) => super.copyWith((message) => updates(message as Tutorial));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tutorial create() => Tutorial._();
  Tutorial createEmptyInstance() => create();
  static $pb.PbList<Tutorial> createRepeated() => $pb.PbList<Tutorial>();
  @$core.pragma('dart2js:noInline')
  static Tutorial getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tutorial>(create);
  static Tutorial _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get length => $_getIZ(2);
  @$pb.TagNumber(3)
  set length($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLength() => $_has(2);
  @$pb.TagNumber(3)
  void clearLength() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<Slide> get slides => $_getList(3);
}

class TutorialInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TutorialInfo', createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'id', protoName: '_id')
    ..a<$core.int>(3, 'length', $pb.PbFieldType.O3)
    ..aOS(4, 'imgDataStr')
    ..hasRequiredFields = false
  ;

  TutorialInfo._() : super();
  factory TutorialInfo() => create();
  factory TutorialInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TutorialInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TutorialInfo clone() => TutorialInfo()..mergeFromMessage(this);
  TutorialInfo copyWith(void Function(TutorialInfo) updates) => super.copyWith((message) => updates(message as TutorialInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TutorialInfo create() => TutorialInfo._();
  TutorialInfo createEmptyInstance() => create();
  static $pb.PbList<TutorialInfo> createRepeated() => $pb.PbList<TutorialInfo>();
  @$core.pragma('dart2js:noInline')
  static TutorialInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TutorialInfo>(create);
  static TutorialInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get length => $_getIZ(2);
  @$pb.TagNumber(3)
  set length($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLength() => $_has(2);
  @$pb.TagNumber(3)
  void clearLength() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get imgDataStr => $_getSZ(3);
  @$pb.TagNumber(4)
  set imgDataStr($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasImgDataStr() => $_has(3);
  @$pb.TagNumber(4)
  void clearImgDataStr() => clearField(4);
}

class TutorialsList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TutorialsList', createEmptyInstance: create)
    ..a<$core.int>(1, 'length', $pb.PbFieldType.O3)
    ..pc<TutorialInfo>(2, 'tutorials', $pb.PbFieldType.PM, subBuilder: TutorialInfo.create)
    ..hasRequiredFields = false
  ;

  TutorialsList._() : super();
  factory TutorialsList() => create();
  factory TutorialsList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TutorialsList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TutorialsList clone() => TutorialsList()..mergeFromMessage(this);
  TutorialsList copyWith(void Function(TutorialsList) updates) => super.copyWith((message) => updates(message as TutorialsList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TutorialsList create() => TutorialsList._();
  TutorialsList createEmptyInstance() => create();
  static $pb.PbList<TutorialsList> createRepeated() => $pb.PbList<TutorialsList>();
  @$core.pragma('dart2js:noInline')
  static TutorialsList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TutorialsList>(create);
  static TutorialsList _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get length => $_getIZ(0);
  @$pb.TagNumber(1)
  set length($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLength() => $_has(0);
  @$pb.TagNumber(1)
  void clearLength() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<TutorialInfo> get tutorials => $_getList(1);
}

class HelperApi {
  $pb.RpcClient _client;
  HelperApi(this._client);

  $async.Future<TutorialsList> getTutorialsList($pb.ClientContext ctx, Empty request) {
    var emptyResponse = TutorialsList();
    return _client.invoke<TutorialsList>(ctx, 'Helper', 'GetTutorialsList', request, emptyResponse);
  }
  $async.Future<Tutorial> getTutorial($pb.ClientContext ctx, Index request) {
    var emptyResponse = Tutorial();
    return _client.invoke<Tutorial>(ctx, 'Helper', 'GetTutorial', request, emptyResponse);
  }
}

