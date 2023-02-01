//
//  File.swift
//  ApplicationOne
//
//  Created by Askar on 23.01.2023.
//

import Foundation

struct Constants {
    
    struct Keys {
        static let api = "b546d4933841b9453fa9ccabe482d1a8"
    }
    
    struct Identifiers {
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let trendingCollectionViewCell = "TrendingCollectionViewCell"
        static let categoryTableViewCell = "CategoryTableViewCell"
        static let movieCollectionViewCell = "MovieCollectionViewCell"
    }
    
    struct Values {

    }
    
    struct Colors {
        
    }
    
    struct Links {
        static let apiUrl = "https://api.themoviedb.org/3/"
        static let trendingUrl = "\(apiUrl)trending/movie/day?api_key=\(Keys.api)"
        static let imageUrl = "https://image.tmdb.org/t/p/w500/" // + poster path
    }
}

enum Category: String, CaseIterable {
    case all = "🔥All"
    case streaming = "🎥Streaming"
    case onTV = "📺On TV"
    case inTheaters = "🍿In Theaters"
}
