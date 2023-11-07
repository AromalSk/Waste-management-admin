part of 'collection_marker_bloc.dart';

@freezed
class CollectionMarkerState with _$CollectionMarkerState {
  const factory CollectionMarkerState({
    required Set<Marker> marker,
  }) = _CollectionMarkerState;

   factory CollectionMarkerState.initial() => CollectionMarkerState(marker: {});
}
