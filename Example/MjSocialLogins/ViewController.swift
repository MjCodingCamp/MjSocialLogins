//
//  ViewController.swift
//  MjSocialLogins
//
//  Created by Mohammad Jeesha on 07/26/2022.
//  Copyright (c) 2022 Mohammad Jeesha. All rights reserved.
//

import UIKit
import GoogleSignIn
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

//Apple Login Delegate methods
extension ViewController: AppleLoginStatusDelegate {
    func appleLoginSuccess(accessToken: String, name: String, email: String) {
        ///Here you can use this accessToken for Apple  user authetication by different services like: Firebase.
        debugPrint(accessToken)
    }
    
    func appleLoginFail(error: AppleAuthError) {
        switch error {
        case .appleDeclinedPermissions:
            //Handle as you want
            break
        case .accessTokenNotFound:
            //Handle as you want
            break
        case .userDataNotFound:
            //Handle as you want
            break
        case .unknown(let error):
            debugPrint(error)
        }
    }
}

//Facebook Login Delegate methods
extension ViewController: FbLoginStatusDelegate {
    func fbLoginSuccess(token: String, userData: [String : Any]) {
        ///Here you can use this token for Facebook  user authetication by different services like: Firebase.
        debugPrint(userData)
    }
    
    func fbLoginFail(error: FbAuthError) {
        switch error {
        case .facebookDeclinedPermissions:
            //Handle as you want
            break
        case .tokenNotFound:
            //Handle as you want
            break
        case .userDataNotFound:
            //Handle as you want
            break
        case .facebookLoginCancelled:
            //Handle as you want
            break
        case .unknown(let error):
            debugPrint(error)
        }
    }
    
    func fbLoginAccess(status: Bool) {
        debugPrint(status)
    }
}

//Google Login Delegate methods
extension ViewController: GoogleLoginStatusDelegate{
    func googleLoginSuccess(userID: String, idToken: String, userProfile: GIDProfileData) {
        ///Here you can use this token for Google user  authetication by different services like: Firebase.
        debugPrint(userID)
        debugPrint(idToken)
        debugPrint(userProfile.email)
    }
    
    func googleLoginFail(error: GoogleAuthError) {
        switch error {
        case .rootViewControllerNotFound:
            //Handle as you want
            break
        case .userIdNotFound:
            //Handle as you want
            break
        case .userIdTokenNotFound:
            //Handle as you want
            break
        case .userDataNotFound:
            //Handle as you want
            break
        case .userProfileNotFound:
            //Handle as you want
            break
        case .unknown(let error):
            debugPrint(error)
        }
    }
}
