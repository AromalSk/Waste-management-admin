import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'collection_marker_event.dart';
part 'collection_marker_state.dart';
part 'collection_marker_bloc.freezed.dart';

class CollectionMarkerBloc
    extends Bloc<CollectionMarkerEvent, CollectionMarkerState> {
  CollectionMarkerBloc() : super(CollectionMarkerState.initial()) {
    on<MarkerProvider>((event, emit) {
      Set<Marker> made = {};
      made.add(
        Marker(
          markerId: MarkerId('defaultMarker'),
          position: LatLng(event.latitude, event.longitude), // Default position
          infoWindow: InfoWindow(title: 'Users Location'),
          icon: BitmapDescriptor.defaultMarker, // Use the default marker icon
        ),
      );
      return emit(state.copyWith(marker: made));
    });
  }
}
