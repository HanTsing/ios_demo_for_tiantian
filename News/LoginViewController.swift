//
//  LoginViewController.swift
//  News
//
//  Created by hanqing on 11/23/15.
//  Copyright © 2015 hanqing. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTextFiled()
        self.password.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func visit(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("listController") as! ListViewController
        vc.role = "visit"
        let nav = UINavigationController(rootViewController: vc) as UINavigationController
        self.presentViewController(nav, animated:true, completion:nil)
    }
    
    
    @IBAction func login(sender: AnyObject) {
        self.login()
    }
    
    private func prepareTextFiled(){
        self.userName.leftViewMode = UITextFieldViewMode.Always
        self.userName.keyboardType = UIKeyboardType.EmailAddress
        self.userName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 10))
        self.userName.layer.cornerRadius = 4.0
        self.userName.layer.borderWidth  = 1.0
        self.userName.layer.borderColor  = UIColor.clearColor().CGColor
        self.userName.layer.borderColor  = UIColor(red: 204.0/255.0, green: 208.0/255.0, blue: 211.0/255.0, alpha: 1).CGColor
        
        self.password.leftViewMode = UITextFieldViewMode.Always
        self.password.keyboardType = UIKeyboardType.EmailAddress
        self.password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 10))
        self.password.layer.cornerRadius = 4.0
        self.password.layer.borderWidth  = 1.0
        self.password.layer.borderColor  = UIColor.clearColor().CGColor
        self.password.layer.borderColor  = UIColor(red: 204.0/255.0, green: 208.0/255.0, blue: 211.0/255.0, alpha: 1).CGColor
    }
    
    func login(){
        if userName.text == "admin" && password.text == "admin" {
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("listController") as! ListViewController
            let nav = UINavigationController(rootViewController: vc) as UINavigationController
            self.presentViewController(nav, animated:true, completion:nil)
        } else {
            let alertView=UIAlertView(title:"", message: "用户名或密码错误!", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField.returnKeyType == UIReturnKeyType.Go {
            login()
            return true
        } else {
            return false
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
