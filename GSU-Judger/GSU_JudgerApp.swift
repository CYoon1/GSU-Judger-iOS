//
//  GSU_JudgerApp.swift
//  GSU-Judger
//
//  Created by Christopher Yoon on 10/17/23.
//

import SwiftUI
import Firebase

//import FirebaseCore
//import FirebaseAuth

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//        return true
//    }
//}



@main
struct GSU_JudgerApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var dataManager = DataManager()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataManager)}
    }
}
