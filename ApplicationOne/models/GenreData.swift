//
//  GenreData.swift
//  ApplicationOne
//
//  Created by Askar on 06.02.2023.
//

import Foundation

struct GenreData: Decodable {
    let genres: [Genre]
    
    struct Genre: Decodable {
        let id: Int
        let name: String
    }
}
