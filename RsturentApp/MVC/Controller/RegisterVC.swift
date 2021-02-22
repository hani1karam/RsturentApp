//
//  RegisterVC.swift
//  RsturentApp
//
//  Created by Abdullah ahmed on 16/02/2021.
//

import UIKit
import NVActivityIndicatorView

class RegisterVC: UIViewController,NVActivityIndicatorViewable{
    //Text Field
    @IBOutlet weak var FullName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func Backtap(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    //Singup Button
    
    @IBAction func SingUpButton(_ sender: Any) {
        let param = ["name:":  FullName.text ?? "" ,
                     "email:": Email.text ?? "",
                     "phone:": Phone.text ?? "",
                     "password":Password.text ?? "",
                     "confirm_password": "secrewt",
                     "address":"Cairoo"]
        startAnimating(CGSize(width: 45, height: 45), message: "",type: .ballSpinFadeLoader, color: .black, textColor: .white)


        NetWorkManager.instance.API(method: .post, url: "https://restaurant.salemsaber.com/api/register", parameters: param) {( error, status, response: RegisterModel?)in
            self.stopAnimating()

            if response?.status == true {
                print(response)
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
                self.navigationController?.pushViewController(vc, animated: false)

            }
            
            else {
                print(error)
                let alert = UIAlertController(title: "", message: "هناك خطا ما", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "حسنا", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)

            }
            
            
        }
        
    }
    
}
