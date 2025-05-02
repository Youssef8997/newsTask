import 'package:equatable/equatable.dart';

abstract class newsEvent extends Equatable{
  const newsEvent();
  List<Object?> get props=> [];
}
class getNewsEvent extends newsEvent{
  final String page;
  getNewsEvent({
    this.page="1"
});
}