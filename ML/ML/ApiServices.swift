import Foundation
import UIKit
import SwiftUI

class ApiServices: ObservableObject {
    @Published var movies:[ResultData] = []
    @Published var theMovieDbDetails:TheMovieDbFilmDetails?
    @Published var omdbMovie:Omdb?
    var currentPage: Int = 1
    var totalPages: Int = 1
    
    func fetchFilms(forFilm movieTitle: String) {
        let urlString = "\(domainTheMovieDb)3/search/movie?\(theMovieDbApiKey)&page=\(self.currentPage)&language=ru-RU&query=\(movieTitle)"
        print(urlString)
        let convertToUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: convertToUrlString!) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let movie = self.decodeJSON(type: MovieData.self, from: data) {
                                DispatchQueue.main.async {
                                    self.movies = movie.results
                                    self.totalPages = movie.totalPages
                                }
                }
            }
        }
        task.resume()
    }
    func fetchTheMovieDbFilm(id: String) {
        let urlString = "\(domainTheMovieDb)3/movie/\(id)?\(theMovieDbApiKey)&language=ru-RU"
        print(urlString)
        let convertToUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: convertToUrlString!) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let movie = self.decodeJSON(type: TheMovieDbFilmDetails.self, from: data) {
                    DispatchQueue.main.async { [self] in
                        self.theMovieDbDetails = movie
                        if self.theMovieDbDetails!.imdbID != nil{
                            fetchOmdbFilmDetailsOnId(imdbId: self.theMovieDbDetails!.imdbID!)}
                    }
                }
            }
        }
        task.resume()
    }
    func fetchOmdbFilmDetailsOnId(imdbId: String) {
        let urlString = "\(domainTheOmdb)?i=\(imdbId)&plot=full&\(theOmdbApiKey)"
        print(urlString)
        let convertToUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: convertToUrlString!) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let movie = self.decodeJSON(type: Omdb.self, from: data) {
                    DispatchQueue.main.async {
                        self.omdbMovie = movie
                    }
                }
            }
        }
        task.resume()
    }

    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
