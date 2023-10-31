import 'package:bloc/bloc.dart';

part 'gender_event.dart';
part 'gender_state.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  GenderBloc() : super(GenderInitial(gender: "")) {
    on<Male>((event, emit) {
      emit(GenderState(gender: "Male"));
    });
    on<Female>((event, emit) {
      emit(GenderState(gender: "Female"));
    });
  }
}
