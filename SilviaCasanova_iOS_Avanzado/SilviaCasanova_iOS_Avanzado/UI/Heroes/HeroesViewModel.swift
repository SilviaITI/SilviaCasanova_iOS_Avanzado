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
    var heroCount: Int {
        heroes.count
    }
    
    func getHeroBy(index: Int) -> Hero? {
        if index > 0 && index <= heroCount {
            heroes[index]
        } else {
            return nil
        }
        return heroes[index]
    }
    
    func onViewAppear() {
        viewState?(.loading(true))
        
        DispatchQueue.global().async {
            defer { self.viewState?(.loading(false)) }
                guard let token = self.secureDataProvider.getToken() else { return }
            self.apiProvider.getHeroes(by: nil,
                                      token: token) { heroes in
                    self.heroes = heroes
                    self.viewState?(.updateTable)
                }
            }
            
            
        }
}
