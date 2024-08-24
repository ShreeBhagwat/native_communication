import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "DIALOG", binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in
     DispatchQueue.main.async{
       if(call.method == "showDialog"){
        let message = call.arguments as! String
        let alert = UIAlertController(title: "Hello", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        // 
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
      }
     }
    })


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
