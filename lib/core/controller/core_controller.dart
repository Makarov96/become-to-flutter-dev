import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension CoreController on Never {
  static var dioProvider = Provider((ref) => Dio());
}
