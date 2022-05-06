import Foundation
import UIKit

class ClientDetailsViewController: UIViewController {
    
    let db = DBManager()
    
    public var completionHandler: ((Bool) -> Void)?
    
    let inputClientID : UITextField = UITextField()
    let inputClientSecret : UITextField = UITextField()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        inputClientID.frame = CGRect(x: 20,
                                     y: view.height-550-view.safeAreaInsets.bottom,
                                     width: view.width-40,
                                     height: 50)
        inputClientSecret.frame = CGRect(x: 20,
                                         y: view.height-470-view.safeAreaInsets.bottom,
                                         width: view.width-40,
                                         height: 50)
        saveButton.frame = CGRect(x: 20,
                                  y: view.height-400-view.safeAreaInsets.bottom,
                                  width: view.width-40,
                                  height: 50)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add dev details"
        view.backgroundColor = .white
        
        displayFields()
        
        view.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
        
        func displayFields(){
            //clientid
            inputClientID.placeholder = "clientID"
            inputClientID.borderStyle = UITextField.BorderStyle.line
            inputClientID.backgroundColor = UIColor.white
            inputClientID.textColor = UIColor.black
            self.view.addSubview(inputClientID)
            
            //clientsecret
            inputClientSecret.placeholder = "clientSecret"
            inputClientSecret.borderStyle = UITextField.BorderStyle.line
            inputClientSecret.backgroundColor = UIColor.white
            inputClientSecret.textColor = UIColor.black
            self.view.addSubview(inputClientSecret)
        }
    }
    
    @objc func didTapSave() {
//        //aici pun logica pentru salvat in baza de date
        if let unwrappedClientId = inputClientID.text {
            print ("client id unwrapped")
            //sleep(3)
                if let unwrappedClientSecret = inputClientSecret.text {
                    print ("client secret unwrapped")
                   // sleep(3)
                   // db.insert(clientid: unwrappedClientId, clientsecret: unwrappedClientSecret)
                    
                    //AuthManager.Constants.clientID = unwrappedClientId
                    //AuthManager.Constants.clientSecret = unwrappedClientSecret
                }
        }
//        if let unwrappedClientSecret = inputClientSecret.text {
//            print ("client secret unwrapped")
//        }
//        db.insert(clientid: unwrappedClientId, clientsecret: unwrappedClientSecret)
        
        //print("clientID = " + db.selectID(i: 1))
        //print("clientSecret = " + db.selectSecret(i: 1))
        
        //print("clientID = " + inputClientID.text!)
        //print("clientSecret = " + inputClientSecret.text!)
        
    }
    
    
}
