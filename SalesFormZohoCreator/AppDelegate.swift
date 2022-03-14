//
//  AppDelegate.swift
//  SalesFormZohoCreator
//
//  Created by Temp on 13/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        
        let vc = ViewController()
        
        let appearnce = UINavigationBarAppearance()
        appearnce.backgroundColor = .white
        UINavigationBar.appearance().scrollEdgeAppearance = appearnce
        UINavigationBar.appearance().standardAppearance = appearnce
        
        let navVc = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = navVc

        return true
    }




}

