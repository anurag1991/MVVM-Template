

import Foundation

protocol ParameterBodyMaker {
    func httpBodyEnvelop()->[String:Any]?
    func encodeBodyEnvelop() throws -> Data?
}

/*
Request Envelops are mentioned here with api path, pathType(Enum with tupple which holds api parameters)
*/
struct LoginEnvelop:Requestable  {
    var apiPath:String { return "/login.php" }
    var httpType:HttpType { return .post }
    var pathType : ServicePath
    
    /* This member property for data model in which data need to be parsed. */
    var modelType:Identifiable.Type? { return UserInfo.self }
}

struct RegEnvelop:Requestable  {
    var apiPath:String { return "/sign_up.php" }
    var httpType:HttpType { return .post }
    var pathType : ServicePath
    
    /* */
    var modelType:Identifiable.Type? { return nil }

}

/*
 ALL services post dictionary is mentioned under enum switch statement.
 These cases get their values in ViewController (or respective controller or other class).
 This enum also wrap a method which provides dictionary for post body.
*/
internal enum ServicePath:ParameterBodyMaker {
    
    case login(username:String, password:String)
    case registration(first_name:String, last_name:String, email:String, pass:String, deviceid:String,phone:String)

    func httpBodyEnvelop()->[String:Any]? {
        
        switch self {
        case .login(username: let user, password: let pwd):

            let postBody = ["email":user, "pass":pwd]
            return postBody
            
        case .registration(first_name: let fname, last_name: let lname, email: let email, pass: let password, deviceid: let did, phone: let ph):
            let postBody = ["first_name":fname,"last_name":lname,"email":email,"pass":password,"deviceid":did,"phone":ph]

            return postBody
        }
    }
    
    func encodeBodyEnvelop() throws -> Data? {
        
        do {
            if let body = self.httpBodyEnvelop() {
            let data = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                return data
            }
        }
        catch  {
            throw error
        }
        
        return nil
    }
}

struct APIEndPoints {
    
}
