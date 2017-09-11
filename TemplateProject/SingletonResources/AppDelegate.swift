

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {

    var window: UIWindow?
    class func sharedDelegate()->AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

//MARK UIApplication Delegates
extension AppDelegate : UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        ConfigEndPoints.shared.initialize()

        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }

}
