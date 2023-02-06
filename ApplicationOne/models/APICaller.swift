//
//  APICaller.swift
//  ApplicationOne
//
//  Created by Askar on 30.01.2023.
//

import Foundation

protocol APICallerDelegate {
    func didUpdateMovieList(with movieList: [MovieModel])
    func didFailWithError(_ error: Error)
}

struct APICaller {
    
    var delegate: APICallerDelegate?
    
    func fetchRequest() {
        for urlString in Constants.Values.urlList {
            guard let url = URL(string: urlString) else { fatalError("Incorrect link!") }
            let task = URLSession.shared.dataTask(with: url) { data, _ , error in
                if let data, error == nil {
                    if let movieList = parseMovieJSON(data) {
                        delegate?.didUpdateMovieList(with: movieList)
                    } else {
                        delegate?.didFailWithError(error!)
                    }
                } else {
                    delegate?.didFailWithError(error!)
                }
            }
            task.resume()
        }
    }
    
    func parseMovieJSON(_ data: Data) -> [MovieModel]? {
        var movieList: [MovieModel] = []
        do {
            let decodedData = try JSONDecoder().decode(MovieData.self, from: data)
            for model in decodedData.results {
                if let backdropPath = model.backdrop_path {
                    let movieModel = MovieModel(backdropPath: backdropPath, id: model.id, title: model.title, posterPath: model.poster_path, genreIds: model.genre_ids)
                    movieList.append(movieModel)
                }
            }
        } catch {
            print(error)
            return nil
        }
        return movieList
    }
    
    func parseGenreJSON(_ data: Data) -> [Int:String]? {
        var genreList: [Int:String] = [:]
        do {
            let decodedData = try JSONDecoder().decode(GenreData.self, from: data)
            for model in decodedData.genres {
                genreList[model.id] = model.name
            }
        } catch {
            print(error)
            return nil
        }
        return genreList
    }
    
}
