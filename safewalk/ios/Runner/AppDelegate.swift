import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)


  // TODO: Add your Google Maps API key
  GMSServices.provideAPIKey("AIzaSyCgMyzwymOJSxFvM-OjMqQn4mjthaHo2c4") 

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
