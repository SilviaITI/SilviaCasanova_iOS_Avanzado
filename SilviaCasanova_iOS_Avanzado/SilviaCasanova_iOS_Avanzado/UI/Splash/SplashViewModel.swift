//
//  SplashViewModel.swift
//  SilviaCasanova_iOS_Avanzado
//
//  Created by Silvia Casanova Martinez on 23/10/23.
//

import Foundation
class SplashViewModel: SplashViewControllerProtocol {
    func onViewAppear() {
        
    }
    
    private let apiProvider: ApiProviderProtocol
    private let secureDataProvider: SecureDataProviderProtocol
    
    var viewState: ((SplashViewState) -> Void)?

    lazy var loginViewModel: LoginViewControllerDelegate = {
        LoginViewModel(
            apiProvider: apiProvider,
            secureDataProvider: secureDataProvider as! SecureDataProvider
        )
    }()

    lazy var heroesViewModel: HeroesViewControllerDelegate = {
        HeroesViewModel(
            apiProvider: apiProvider,
            secureDataProvider: secureDataProvider
        )
    }()
    
  
    init(apiProvider: ApiProviderProtocol, secureDataProvider: SecureDataProviderProtocol) {
        self.apiProvider = apiProvider
        self.secureDataProvider = secureDataProvider
    }
}
