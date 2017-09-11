

import Foundation

protocol ViewModelParams {
    func apiCallWithType(type:ServicePath)
}

class LoginViewModel:BaseViewModels, ViewModelParams  {
    
    var userInfo:UserInfo?
    let webAPIWrapper:WebAPIWrapper = WebAPIWrapper()
    
    func apiCallWithType(type:ServicePath) {
        let envelop = LoginEnvelop(pathType: type)
        webAPIWrapper.delegate = self
        webAPIWrapper.callServiceWithRequest(requestEnvelop: envelop)
    }
    
    //MARK:Overridden Delegate Method Of Webservice Wrapper.
    override func didReceiveResponse(request:Requestable, data:Any?,error:Error?) {
        
        guard let d = data else {
            self.delegate?.refreshController(model: self, info: data, error: error)
            return
        }
        
        if let result = d as? ResponseResult<Any>,
            let resultValue = result.error   {
            self.userInfo = nil
            self.delegate?.refreshController(model: self, info: nil, error: resultValue)
        }
        
        if let result = d as? ResponseResult<Any>,
            let resultValue = result.value as? UserInfo {
            self.userInfo = resultValue
            self.delegate?.refreshController(model: self, info: nil, error: error)
        }
    }
}

