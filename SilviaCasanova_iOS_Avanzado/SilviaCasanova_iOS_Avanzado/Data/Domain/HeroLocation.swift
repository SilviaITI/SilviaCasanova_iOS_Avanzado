//
//  HeroLocation.swift
//  SilviaCasanova_iOS_Avanzado
//
//  Created by Silvia Casanova Martinez on 23/10/23.
//

import Foundation

typealias HeroLocations = [HeroLocation]

struct HeroLocation: Codable {
    let id: String?
    let latitud: String?
    let longitud: String?
    let date: String?
    let hero: Hero?
}
