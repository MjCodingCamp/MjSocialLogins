//
//  FbLogin.swift
//  MjSocialLogins
//
//  Created by Mohammad Jeeshan on 30/07/22.
//  Copyright (c) 2022 Mohammad Jeesha. All rights reserved.
//

import SwiftUI
import FBSDKLoginKit
import AuthenticationServices

public protocol FbLoginStatusDelegate {
    func fbLoginSuccess(token: String, userData : [String: Any])
    func fbLoginFail(error: String)
}

public class FbLoginController: UIViewController {
    private var delegate: FbLoginStatusDelegate?
    
    public init(delegate: FbLoginStatusDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    public func beginFbLogin() {
        LoginManager().logIn(permissions: [kEmailPermission, kProfilePermission], from: self) { res, error in
            if let error = error {
                self.delegate?.fbLoginFail(error: error.localizedDescription)
            } else {
                guard let token = res?.token?.tokenString else {
                    self.delegate?.fbLoginFail(error: kTokenNotFound)
                    return
                }
                self.fetchUserProfile(token: token)
            }
        }
    }
    
    private func fetchUserProfile(token: String) {
        GraphRequest(graphPath: "/me", parameters: [kParamaterFields: kFieldsName]).start { connections, res, error in
            if let error = error {
                self.delegate?.fbLoginFail(error: error.localizedDescription)
            } else {
                guard let userData = res as? [String: Any] else {
                    self.delegate?.fbLoginFail(error: kUserDataNotFound)
                    return
                }
                self.delegate?.fbLoginSuccess(token: token, userData: userData)
            }
        }
    }
}
