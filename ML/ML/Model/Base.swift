import Foundation
import SwiftUI

class Base:ObservableObject {
    static let shared = Base()
    let defaults = UserDefaults.standard
    var savedMovies:[SavedResultData]{
        get{
            if let data = defaults.value(forKey: "movies") as? Data{
                return try! PropertyListDecoder().decode([SavedResultData].self, from: data)
            } else{
                return [SavedResultData]()
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue){
                defaults.set(data, forKey: "movies")
            }
        }
    }
    func deleteMovie(index:Int){
        savedMovies.remove(at: index)
        print(">>>>>get \(savedMovies.count) items in deleteMovie")
    }
    func addMovie(id:Int?, imdbID: String?, posterPath: String?, releaseDate: String?, title: String?, originalTitle: String?, overview: String?, genreIDS: [Int]?, popularity: Double?,  voteAverage: Double?, voteCount: Int?, year: String?, director: String?, writer: String?, actors: String?,runtime: Int?, genres: String?){
        let movie = SavedResultData(id: id, imdbID: imdbID, posterPath: posterPath, releaseDate: releaseDate, title: title, originalTitle: originalTitle, overview: overview, genreIDS: genreIDS, popularity: popularity, voteAverage: voteAverage, voteCount: voteCount, year: year, director: director, writer: writer, actors: actors, runtime: runtime, genres: genres)
        savedMovies.append(movie)
        print(">>>>>get \(savedMovies.count) items in addMovie")
    }
}
struct SavedResultData: Codable, Identifiable, Equatable{
    let id: Int?
    let imdbID: String?
    let posterPath: String?
    let releaseDate: String?
    var title: String?
    let originalTitle: String?
    let overview: String?
    let genreIDS: [Int]?
    let popularity: Double?
    let voteAverage: Double?
    let voteCount: Int?
    let year: String?
    let director : String?
    let writer: String?
    let actors: String?
    let runtime: Int?
    let genres: String?
}

