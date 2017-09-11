

import Foundation
/*
This structure has member function to set the current build scheme. Current build scheme selected in XCode will be set into project info.plist key named as APP_ENV. This key is also mentioned under Build Setting
 where each schemes names are mentioned. All these name must be equal to the names as mentioned under the Enum of AppEnvMode.
 
*/
struct ConfigEndPoints {
    
    internal enum AppEnvMode:String {
        case Undefined = "Undefined"
        case Debug = "Debug"
        case Dev = "Development"
        case Prod = "Production"
        
        /*
         Set your project scheme base urls
         */
        func baseEndPoint()->String? {

            switch self {
            case .Debug, .Dev:
                return "http://64.150.183.17:1054"
            case .Prod:
                return "http://64.150.183.17:1054"
            default:
                return "http://64.150.183.17:1054"
            }
        }
    }

    private var mode: AppEnvMode?
    static var shared = ConfigEndPoints()
    
    var appMode:AppEnvMode {
        get {
            return mode!
        }
    }
    
    /* This method need to be called when app launches. Ideal place to call this method at the very beginining of AppDelegate delegate method didFinishLaunching */
    mutating func initialize() {
        self.mode = .Undefined
        
        /* Value is captured from info.plist. Value in info.plist will come from User-Defined Variables APP_ENV */
        if let modeString = Bundle.main.infoDictionary?["APP_ENV"] as? String,
            let modeType = AppEnvMode(rawValue: modeString) {
            self.mode = modeType
        }
    }
}

