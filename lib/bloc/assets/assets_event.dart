part of 'assets_bloc.dart';

@freezed
sealed class AssetsEvent with _$AssetsEvent {
  const factory AssetsEvent.loadRequested() = AssetsEventLoadRequested;
}
