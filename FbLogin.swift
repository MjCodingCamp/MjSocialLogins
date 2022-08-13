//
//  FbLogin.swift
//  MjSocialLogins
//
//  Created by Mohammad Jeeshan on 30/07/22.
//  Copyright (c) 2022 Mohammad Jeeshan. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import AuthenticationServices
 
public protocol FbLoginStatusDelegate {
    func fbLoginSuccess(token: String, userData : [String: Any])
    func fbLoginFail(error: FbAuthError)
    func fbLoginAccess(status: Bool)
}

public class FbLoginController: UIViewController {
    private var delegate: FbLoginStatusDelegate?
    
    public init(delegate: FbLoginStatusDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    public func beginFbLogin() {
        LoginManager.init().logIn(permissions: [kEmailPermission, kProfilePermission], from: self) { result, error in
            if let error =  error {
                self.delegate?.fbLoginFail(error: .unknown(error.localizedDescription))
                self.delegate = nil
            } else {
                guard let result = result else {
                    self.delegate?.fbLoginFail(error: .facebookDeclinedPermissions)
                    self.delegate = nil
                    return
                }
                if result.isCancelled {
                    self.delegate?.fbLoginFail(error: .facebookLoginCancelled)
                    self.delegate = nil
                } else {
                    guard let token = result.token?.tokenString else {
                        self.delegate?.fbLoginFail(error: .tokenNotFound)
                        self.delegate = nil
                        return
                    }
                    self.delegate?.fbLoginAccess(status: true)
                    self.fetchUserProfile(token: token)
                }
                
            }
        }
    }
    
    private func fetchUserProfile(token: String) {
        GraphRequest(graphPath: "/me", parameters: [kParamaterFields: kFieldsName]).start { connections, res, error in
            if let error = error {
                self.delegate?.fbLoginFail(error: .unknown(error.localizedDescription))
                self.delegate = nil
            } else {
                guard let userData = res as? [String: Any] else {
                    self.delegate?.fbLoginFail(error: .userDataNotFound)
                    self.delegate = nil
                    return
                }
                self.delegate?.fbLoginSuccess(token: token, userData: userData)
                self.delegate = nil
            }
        }
    }
}
