//
//  ViewController.swift
//  RsturentApp
//
//  Created by Abdullah ahmed on 14/02/2021.
//

import UIKit
import NVActivityIndicatorView

class LonginVC: UIViewController,NVActivityIndicatorViewable {
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("wrillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewdidappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    
    
    @IBAction func RegisterTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC")
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    @IBAction func SinginButton(_ sender: Any) {
        let param = ["email":Email.text ?? "" , "password":Password.text ?? "" ] as [String: Any]
        startAnimating(CGSize(width: 45, height: 45), message: "",type: .ballSpinFadeLoader, color: .black, textColor: .white)

        NetWorkManager.instance.API(method: .post, url:"https://restaurant.salemsaber.com/api/login" , parameters:param){(error, status,response:LoginModel?) in
            self.stopAnimating()

            if response? .status == true {
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


