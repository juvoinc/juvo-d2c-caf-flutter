import 'package:passive_face_liveness_nodatabinding/android/sensor_orientation_settings.dart';
import 'package:passive_face_liveness_nodatabinding/android/sensor_stability_settings.dart';

class SensorSettingsAndroid {
  SensorStabilitySettingsAndroid? sensorStabilitySettings;
  SensorOrientationAndroid? sensorOrientationAndroid;

  SensorSettingsAndroid(
      {this.sensorStabilitySettings, this.sensorOrientationAndroid});

  Map asMap() {
    Map<String, dynamic> map = new Map();

    map["sensorStabilitySettings"] = sensorStabilitySettings?.asMap();
    map["sensorOrientationAndroid"] = sensorOrientationAndroid?.asMap();

    return map;
  }
}
