
import Foundation

enum HttpType:String {
    case get = "GET"
    case post = "POST"
}

/*
 All request model should comfirm this protocol
 */
protocol Requestable {
    var basePath:String? { get }
    var apiPath:String {get}
    var httpType:HttpType {get}
    var pathType : ServicePath {get set}
    var modelType:Identifiable.Type? {get}
}


// MARK: - Protocol is extended with common functionality methods like basePath. In addition to that, protocol extension contains some generic methods like requestURL and httpHeaders etc.
extension Requestable {
    
    var basePath:String? {
        return ConfigEndPoints.shared.appMode.baseEndPoint()
    }
    
    func requestURL()->URL? {
        if let path = self.basePath {
            let fullPath = path+self.apiPath
            return URL(string: fullPath)
        }
        
        return nil
    }
    
    func httpHeaders()->[String:String]? {
        
        var dict:[String:String] = [:]
        dict["Content-Type"] = "application/json"
        
        return dict
    }
    
}
