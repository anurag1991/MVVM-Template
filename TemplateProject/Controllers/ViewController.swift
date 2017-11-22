

import UIKit
import SwiftyBeaver

class ViewController: UIViewController {

    let viewModel = LoginViewModel()
    let viewModelReg = RegistrationViewModel()
    let log = SwiftyBeaver.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* For custom logging. Check SwiftyBeaver Class */
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss$d $L $M"
        log.addDestination(console)
        
        //callRegistrationService()
        callLoginService()
    }

    //MARK: Login Service Call/Registration Service Call..
    func callLoginService() {
        let login = ServicePath.login(username: "youremail@.com", password: "yourpassword")
        viewModel.delegate = self
        viewModel.apiCallWithType(type: login)
    }
    
    func callRegistrationService() {
         let registration = ServicePath.registration(first_name: "Name", last_name: "lastNaame", email: "youremail@.com", pass: "welcome", deviceid: "blahblah2121", phone: "2345678903")
        viewModelReg.delegate = self
        viewModelReg.apiCallWithType(type: registration)
    }
}

extension ViewController:BaseModelDelegate {
    
    func refreshController(model:BaseViewModels?,info:Any?,error:Error?) {
            //Refresh the screen over here...
        
        log.debug(viewModel.userInfo?.firstName as Any)
    }
}

