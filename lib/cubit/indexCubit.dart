import 'package:flutter_bloc/flutter_bloc.dart';

class IndexCubit extends Cubit<int> {
  IndexCubit() : super(0);
  void saySomething() => {print("sonething"), emit(state + 1)};
}
