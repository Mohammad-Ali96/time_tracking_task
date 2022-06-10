import 'package:time_tracking/features/home_page/domain/entities/enum/task_type.dart';
import 'package:time_tracking/features/home_page/domain/entities/time_frames.dart';

class TaskInfo {
  final TimeFrames timeFrames;
  final TaskType title;

  TaskInfo({
    required this.timeFrames,
    required this.title,
  });
}
