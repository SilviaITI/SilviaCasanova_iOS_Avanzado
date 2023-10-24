//
//  LoginViewModel.swift
//  SilviaCasanova_iOS_Avanzado
//
//  Created by Silvia Casanova Martinez on 23/10/23.
//

import Foundation

class LoginViewModel: LoginViewControllerDelegate {

    
    var viewState: ((LoginViewState) -> Void)?
    
    private let apiProvider: ApiProviderProtocol
    private let secureDataProvider: SecureDataProviderProtocol
    
    func onLoginPressed(email: String?, password: String?) {
      
        guard self.isValid(email: email) else {
            self.viewState?(.showErrorEmail("Datos incorrectos"))
            return
        }
        guard self.isValid(password: password) else {
            self.viewState?(.showErrorPassword("Datos incorrectos"))
            return
        }
            doLoginWith(email: email ?? "",
                                        password: password ?? "")
                            
    }
    
    init(
        apiProvider: ApiProviderProtocol,
        secureDataProvider: SecureDataProvider) {
            self.apiProvider = apiProvider
            self.secureDataProvider = secureDataProvider
            
            
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(onLoginResponse),
                name: NotificationCenter.apiLoginNotification,
                object: nil
            )
        }

        deinit {
            NotificationCenter.default.removeObserver(self)
        }
        
    
    private func isValid(email: String?) -> Bool {
        email?.isEmpty == false && (email?.contains("@") ?? false)
    }
    private func isValid(password: String?) -> Bool {
        password?.isEmpty == false && (password?.count ?? 0) >= 4
    }
    private func doLoginWith(email: String, password: String) {
           apiProvider.login(for: email,
                             with: password)
       }
    
    @objc func onLoginResponse(_ notification: Notification) {
        defer { viewState?(.loading(false))
        }
            guard let token = notification.userInfo? [NotificationCenter.tokenKey] as? String,
                  !token.isEmpty else {
                return
            }
        }
    }



