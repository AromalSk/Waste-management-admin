part of 'collection_marker_bloc.dart';

@freezed
class CollectionMarkerEvent with _$CollectionMarkerEvent {
  const factory CollectionMarkerEvent.markerProvider(double latitude,double longitude) = MarkerProvider;
}
