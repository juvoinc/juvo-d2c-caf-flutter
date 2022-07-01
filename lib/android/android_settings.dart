import 'capture_stage/capture_stage.dart';
import 'customization.dart';
import 'sensor_settings.dart';

class DocumentDetectorAndroidSettings {
  DocumentDetectorCustomizationAndroid? customization;
  SensorSettingsAndroid? sensorSettings;
  List<CaptureStage>? captureStages;
  bool? enableSwitchCameraButton;
  bool? enableGoogleServices;
  bool? useRoot;
  bool? useEmulator;

  DocumentDetectorAndroidSettings(
      {this.customization,
      this.sensorSettings,
      this.captureStages,
      this.enableSwitchCameraButton,
      this.enableGoogleServices,
      this.useEmulator,
      this.useRoot});

  Map asMap() {
    Map<String, dynamic> map = new Map();

    map["customization"] = customization?.asMap();
    map["sensorSettings"] = sensorSettings?.asMap();
    map["enableSwitchCameraButton"] = enableSwitchCameraButton;
    map["enableGoogleServices"] = enableGoogleServices;
    map["useEmulator"] = useEmulator;
    map["useRoot"] = useRoot;

    if (captureStages != null) {
      List<Map<String, dynamic>> stagesMap = [];
      for (var stage in captureStages!) {
        stagesMap.add(stage.asMap() as Map<String, dynamic>);
      }
      map["captureStages"] = stagesMap;
    }
    return map;
  }
}
