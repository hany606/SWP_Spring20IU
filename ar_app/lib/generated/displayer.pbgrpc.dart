///
//  Generated code. Do not modify.
//  source: displayer.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'displayer.pb.dart' as $0;
export 'displayer.pb.dart';

class HelperClient extends $grpc.Client {
  static final _$getTutorialsList =
      $grpc.ClientMethod<$0.Empty, $0.TutorialsList>(
          '/displayer.Helper/GetTutorialsList',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TutorialsList.fromBuffer(value));
  static final _$getTutorial = $grpc.ClientMethod<$0.Index, $0.Tutorial>(
      '/displayer.Helper/GetTutorial',
      ($0.Index value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Tutorial.fromBuffer(value));

  HelperClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.TutorialsList> getTutorialsList($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTutorialsList, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Tutorial> getTutorial($0.Index request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTutorial, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class HelperServiceBase extends $grpc.Service {
  $core.String get $name => 'displayer.Helper';

  HelperServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.TutorialsList>(
        'GetTutorialsList',
        getTutorialsList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.TutorialsList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Index, $0.Tutorial>(
        'GetTutorial',
        getTutorial_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Index.fromBuffer(value),
        ($0.Tutorial value) => value.writeToBuffer()));
  }

  $async.Future<$0.TutorialsList> getTutorialsList_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getTutorialsList(call, await request);
  }

  $async.Future<$0.Tutorial> getTutorial_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Index> request) async {
    return getTutorial(call, await request);
  }

  $async.Future<$0.TutorialsList> getTutorialsList(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Tutorial> getTutorial(
      $grpc.ServiceCall call, $0.Index request);
}
