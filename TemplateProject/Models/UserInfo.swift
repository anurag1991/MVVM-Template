

import Foundation

protocol Identifiable {
    static func parseJSON(data:Any?)->ResponseResult<Any>?
}

class UserInfo:Identifiable {

    var userId:String?
    var firstName:String?
    var email:String?
    var lastName:String?
    
    static func parseJSON(data:Any?)->ResponseResult<Any>? {

        if let d = data as? [String:String] {

                if let status = d["status"], status != "200" {
                    let desc = d["msg"]
                    let err = APIResponseError.generalError(domain: "Parsing Error", description: desc, errorCode:111)
                    return .failure(err)
                }
           
            let user = UserInfo()
            user.firstName = d["first_name"]
            user.lastName = d["last_name"]
            user.email = d["email"]
            user.userId = d["id"]

            return .success(user)
        }
       
        let err = APIResponseError.generalError(domain: "Parsing Error", description: "Wrong Data Format", errorCode:111)
        return .failure(err)
   }

}
