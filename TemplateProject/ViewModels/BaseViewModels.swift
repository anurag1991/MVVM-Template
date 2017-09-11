

import Foundation

protocol BaseModelDelegate:class {
    func refreshController(model:BaseViewModels?,info:Any?,error:Error?)
}

class BaseViewModels:WebApiWrapperDelegate {
    var delegate:BaseModelDelegate? = nil
    
    //MARK: Delegate Method Of Webservice Wrapper. It will work if not overridden
    func didReceiveResponse(request:Requestable, data:Any?,error:Error?) {
        self.delegate?.refreshController(model: self, info: data, error: error)
    }
}
