//
//  TheSeerApp.swift
//  TheSeer
//
//  Created by RyzenMac on 9/25/20.
//

import SwiftUI
import Firebase

@main
struct MainApp {
    static func main() {
        if #available(iOS 14.0, *) {
            TheSeerApp.main()
        } else {
            UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(AppDelegate.self))
        }
    }
}

// For Older iOS
class AppDelegage : UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let mainView = AppView()
        
        if let windowScence = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScence)
            window.rootViewController = UIHostingController(rootView: mainView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
@available(iOS 14.0, *)
struct TheSeerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
    var body: some Scene {
        WindowGroup {
           AppView()
        }
    }
//    func firebaseConfigure() {
//        FirebaseConfiguration.shared.setLoggerLevel(.min)
//        FirebaseApp.configure()
//    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
}
