import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/api/client.dart';
import '/api/entity/asset.dart';
import '/utils/distinct.dart';
import '/utils/result.dart';

part 'assets_bloc.freezed.dart';
part 'assets_event.dart';
part 'assets_state.dart';

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  AssetsBloc({
    required final ApiClient apiClient,
  }) : _apiClient = apiClient,
       super(const AssetsState(assets: Loading())) {
    on<AssetsEvent>(
      (final event, final emit) => switch (event) {
        AssetsEventLoadRequested() => _loadRequested(event, emit),
      },
      transformer: distinct,
    );
  }

  final ApiClient _apiClient;

  Future<void> _loadRequested(
    final AssetsEvent event,
    final Emitter<AssetsState> emit,
  ) async {
    try {
      final assets = await _apiClient.getAssets();
      emit(state.copyWith(assets: Success(assets)));
    } on Exception catch (error) {
      emit(state.copyWith(assets: Error(error)));
    } catch (error) {
      emit(state.copyWith(assets: Error(Exception(error))));
    }
  }
}
