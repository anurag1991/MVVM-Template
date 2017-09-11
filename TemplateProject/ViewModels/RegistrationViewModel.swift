

import Foundation

class RegistrationViewModel:BaseViewModels, ViewModelParams {
    
    let webAPIWrapper:WebAPIWrapper = WebAPIWrapper()
    
    func apiCallWithType(type:ServicePath) {
        
        let envelop = RegEnvelop(pathType: type)
        webAPIWrapper.delegate = self
        webAPIWrapper.callServiceWithRequest(requestEnvelop: envelop)
    }
    
    override func didReceiveResponse(request:Requestable, data:Any?,error:Error?) {
        /* Here developers has to do parsing and return back control to controller */
        
        self.delegate?.refreshController(model: self, info: data, error: error)
    }
}
