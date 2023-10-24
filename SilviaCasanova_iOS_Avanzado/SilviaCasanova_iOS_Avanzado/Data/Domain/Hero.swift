//
//  Hero.swift
//  SilviaCasanova_iOS_Avanzado
//
//  Created by Silvia Casanova Martinez on 23/10/23.
//

import Foundation

typealias Heroes = [Hero]

struct Hero: Codable {
    let id: String?
    let name: String?
    let description: String?
    let photo: String?
    let favorite: String?
}
