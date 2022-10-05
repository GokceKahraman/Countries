//
//  CountryListEntity.swift
//  Countries
//
//  Created by Gökçe Kahraman on 29.09.2022.
//

import Foundation


struct CountryCellViewModel{
    //dummy data
    var countryName : String?
    var code : String?
    var wikiDataId: String?
}

struct CountryDetailsViewModel{
    var flagImageUri: String?
    var code : String?
    var wikiDataId: String?
    
}

struct CountryResponseModel: Decodable {
    let data: [Country]
}

struct Country: Decodable{
    var name: String
    var code : String
    var flagImageUri: String?
    var wikiDataId: String
    
}

struct CountryDetailResponseModel: Decodable {
    let data: Country
}


