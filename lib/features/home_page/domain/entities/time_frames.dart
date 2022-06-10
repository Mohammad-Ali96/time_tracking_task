import 'package:time_tracking/features/home_page/domain/entities/task_duration.dart';

class TimeFrames {
  final TaskDuration daily;
  final TaskDuration weekly;
  final TaskDuration monthly;

  TimeFrames({
    required this.daily,
    required this.weekly,
    required this.monthly,
  });
}
