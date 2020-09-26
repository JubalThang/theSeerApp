//
//  TheSeerApp.swift
//  TheSeer
//
//  Created by RyzenMac on 9/25/20.
//

import SwiftUI
import Firebase

@main
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
