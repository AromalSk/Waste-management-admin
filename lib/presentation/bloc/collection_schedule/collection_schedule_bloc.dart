import 'package:bloc/bloc.dart';
import 'package:waste_management_admin/domain/entities/collection_schedule.dart';
import 'package:waste_management_admin/domain/repositories/collection_schedule.dart';

part 'collection_schedule_event.dart';
part 'collection_schedule_state.dart';

class CollectionScheduleBloc
    extends Bloc<CollectionScheduleEvent, CollectionScheduleState> {
  CollectionScheduleBloc()
      : super(CollectionScheduleInitial(collectionList: collectionWeekdays())) {
    on<CollectionScheduleEvent>((event, emit) {
      emit(CollectionScheduleState(collectionList: collectionWeekdays()));
    });
  }
}
