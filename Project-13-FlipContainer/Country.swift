//
//  Country.swift
//  Project-13-FlipContainer
//
//  Created by suhail on 18/01/24.
//

import Foundation

struct Country: Codable{
    let name: Name
    let flag: Flag
}

struct Name: Codable{
    let shortname: String
    let fullname: String?
}

struct Flag: Codable{
    let officialflag: OfficialFlag
}

struct OfficialFlag: Codable{
    let png: String
}


// MARK: - Country View Model

struct CountryViewModel{
    let shortNAme: String
    let fullName: String
    let flagURL: String
    
    
    
}
