//
//  DetailedMovieData.swift
//  ApplicationOne
//
//  Created by Askar on 07.02.2023.
//

import Foundation

struct DetailedMovieData: Decodable {
    let poster_path: String
    let backdrop_path: String
    let title: String
    let tagline: String
    let overview: String
}
