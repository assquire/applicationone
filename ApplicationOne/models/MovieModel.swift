//
//  MovieModel.swift
//  ApplicationOne
//
//  Created by Askar on 31.01.2023.
//

import Foundation

struct MovieModel {
    
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title: String
    let description: String
    let posterPath: String
    let mediaType: String
    let genreIds: [Int]
    let releaseDate: String
    let voteAverage: Double
}
