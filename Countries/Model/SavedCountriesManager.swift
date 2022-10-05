//
//  SavedCountriesManager.swift
//  Countries
//
//  Created by Gökçe Kahraman on 4.10.2022.
//

import Foundation

class SavedCountriesManager {
    
    static let shared = SavedCountriesManager()
    
    var countries: [CountryCellViewModel] = []
}
