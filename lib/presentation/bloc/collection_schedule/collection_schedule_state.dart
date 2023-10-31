// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'collection_schedule_bloc.dart';

class CollectionScheduleState {
 Future<List<CollectionSchedule>> collectionList ;
  CollectionScheduleState({
    required this.collectionList,
  });
}

final class CollectionScheduleInitial extends CollectionScheduleState {
  CollectionScheduleInitial({required super.collectionList});
}
