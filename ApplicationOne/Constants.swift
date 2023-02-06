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
        static let urlList = [URLs.trending, URLs.nowPlaying, URLs.popular, URLs.topRated, URLs.upcoming]
    }
    
    struct Colors {
        
    }
    
    struct Links {
        static let api = "https://api.themoviedb.org/3/"
        static let image = "https://image.tmdb.org/t/p/w500/" // + poster path
    }
    
    struct URLs {
        static let trending = "\(Links.api)trending/movie/day?api_key=\(Keys.api)"
        static let nowPlaying = "\(Links.api)movie/now_playing?api_key=\(Keys.api)"
        static let popular = "\(Links.api)movie/popular?api_key=\(Keys.api)"
        static let topRated = "\(Links.api)movie/top_rated?api_key=\(Keys.api)"
        static let upcoming = "\(Links.api)movie/upcoming?api_key=\(Keys.api)"
    }
    
// https://api.themoviedb.org/3/movie/now_playing?api_key=b546d4933841b9453fa9ccabe482d1a8&language=en-US&page=1
}

enum Category: String, CaseIterable {
    case nowPlaying = "🔥Now Playing"
    case popular = "🎥Popular"
    case topRated = "📺Top Rated"
    case upcoming = "🍿Upcoming"
}
