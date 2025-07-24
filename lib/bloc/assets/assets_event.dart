part of 'assets_bloc.dart';

@freezed
sealed class AssetsEvent with _$AssetsEvent {
  const factory AssetsEvent.loadRequested({
    @Default(15) final int limit,
    final int? offset,
  }) = AssetsEventLoadRequested;
}
