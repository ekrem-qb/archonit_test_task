import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.loading() = Loading;
  const factory Result.error(final Exception error) = Error;
  const factory Result.success(final T data) = Success;
}
