///
//  Generated code. Do not modify.
//  source: displayer.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'displayer.pb.dart' as $0;
import 'displayer.pbjson.dart';

export 'displayer.pb.dart';

abstract class HelperServiceBase extends $pb.GeneratedService {
  $async.Future<$0.TutorialsList> getTutorialsList($pb.ServerContext ctx, $0.Empty request);
  $async.Future<$0.Tutorial> getTutorial($pb.ServerContext ctx, $0.Index request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'GetTutorialsList': return $0.Empty();
      case 'GetTutorial': return $0.Index();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'GetTutorialsList': return this.getTutorialsList(ctx, request);
      case 'GetTutorial': return this.getTutorial(ctx, request);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => HelperServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => HelperServiceBase$messageJson;
}

