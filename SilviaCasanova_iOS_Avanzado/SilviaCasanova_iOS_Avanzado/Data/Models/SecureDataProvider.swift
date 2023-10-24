//
//  SecureDataProvider.swift
//  SilviaCasanova_iOS_Avanzado
//
//  Created by Silvia Casanova Martinez on 23/10/23.
//

import Foundation
import KeychainSwift

protocol SecureDataProviderProtocol {
    func save(token: String)
    func getToken() -> String?
}

final class SecureDataProvider: SecureDataProviderProtocol {
    private let keychain = KeychainSwift()
    static let shared = SecureDataProvider()

    private enum Key {
        static let token = "KEY_KEYCHAIN_TOKEN"
    }

    func save(token: String) {
        keychain.set(token, forKey: Key.token)
    }

    func getToken() -> String? {
        keychain.get(Key.token)
    }
}
