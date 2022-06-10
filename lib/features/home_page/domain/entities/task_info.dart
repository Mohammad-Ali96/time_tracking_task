import 'package:time_tracking/features/home_page/domain/entities/time_frames.dart';
import 'package:time_tracking/features/home_page/domain/enum/task_type.dart';

class TaskInfo {
  final TimeFrames timeFrames;
  final TaskType title;

  TaskInfo({
    required this.timeFrames,
    required this.title,
  });
}
