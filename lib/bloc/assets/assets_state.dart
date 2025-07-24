part of 'assets_bloc.dart';

@freezed
sealed class AssetsState with _$AssetsState {
  const factory AssetsState({
    required final Result<List<Asset>> assets,
    final int? totalCount,
  }) = _AssetsState;
}
