import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/network/error_message_model.dart';
part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorMessageResponse error) = Failure<T>;
}
