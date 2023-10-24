//
//  HeroesViewModel.swift
//  SilviaCasanova_iOS_Avanzado
//
//  Created by Silvia Casanova Martinez on 24/10/23.
//

import Foundation
class HeroesViewModel: HeroesViewControllerDelegate {
    var viewState: ((HeroesViewState) -> Void)?
    
    private let apiProvider: ApiProviderProtocol
    private let secureDataProvider: SecureDataProviderProtocol
    private var heroes: Heroes = []
    
    init(apiProvider: ApiProviderProtocol, secureDataProvider: SecureDataProviderProtocol) {
        self.apiProvider = apiProvider
        self.secureDataProvider = secureDataProvider
    }
    
    func onViewAppear() {
        viewState?(.loading(true))
        
        DispatchQueue.global().async {
            defer { viewState?(.loading(false))
                guard let token = secureDataProvider.getToken()
        }
        apiProvider.getHeroes(by: Hero.id, token: token, completion: <#T##((Heroes) -> Void)?##((Heroes) -> Void)?##(Heroes) -> Void#>)
    }
}
