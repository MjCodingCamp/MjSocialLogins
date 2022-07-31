//
//  ViewController.swift
//  MjSocialLogins
//
//  Created by Mohammad Jeesha on 07/26/2022.
//  Copyright (c) 2022 Mohammad Jeesha. All rights reserved.
//

import UIKit
import MjSocialLogins

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func appleLoginBtn(_ sender: UIButton) {
        let appleLoginController = AppleLoginController(delegate: self)
        appleLoginController.beginAppleLogin()
    }
    @IBAction func fbLoginBtn(_ sender: UIButton) {
        let fbLoginController = FbLoginController(delegate: self)
        fbLoginController.beginFbLogin()
    }
    @IBAction func googleLoginBtn(_ sender: UIButton) {
        let googleLoginController = GoogleLoginController(delegate: self)
        googleLoginController.beginGoogleLogin(clientID: "1052912351070-ir4udtjti6n0oqav7kbjmc8beomcllmj.apps.googleusercontent.com")
    }
    
}

// Apple Login Delegate methods
extension ViewController: AppleLoginStatusDelegate{
    func appleLoginSuccess(accessToken: String, name: String, email: String) {
        print(accessToken) //Here you can use this accessToken for Apple user authetication by different services like: Firebase.
    }
    
    func appleLoginFail(error: String) {
        print(error) //Here you can handle this error as you want.
    }
}

// Facebook Login Delegate methods
extension ViewController: FbLoginStatusDelegate {
    func fbLoginSuccess(token: String, userData: [String : Any]) {
        print(userData)  //Here you can save or use user data according to the requirements.
        print(token)    //Here you can use this token for facebook user authetication by different services like: Firebase.
    }
    
    func fbLoginFail(error: String) {
        print(error) //Here you can handle this error as you want.
    }
}

// Google Login Delegate methods
extension ViewController: GoogleLoginStatusProtocol{
    func googleLoginSuccess(userID: String, idToken: String, profileImageUrl: String?, email: String?, firstName: String?, lastName: String?) {
        print(userID)
    }
    
    func googleLoginFail(error: String) {
        print(error) //Here you can handle this error as you want.
    }
}
