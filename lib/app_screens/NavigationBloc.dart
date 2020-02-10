import 'package:bloc/bloc.dart';

import 'Maps_appointmentscreen.dart';


enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => Maps_appointmentscreen();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield Maps_appointmentscreen();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield Maps_appointmentscreen();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield Maps_appointmentscreen();
        break;
    }
  }
}
