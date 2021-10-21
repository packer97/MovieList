import Foundation
import SwiftUI

class Genres {
    func getGenres (numbers:[Int]) -> String {
        var genreArray = Array<String>()
        for number in numbers {
            switch number {
            case 28:
                genreArray.append("Action")
            case 12:
                genreArray.append("Adventure")
            case 16:
                genreArray.append("Animation")
            case 35:
                genreArray.append("Comedy")
            case 80:
                genreArray.append("Crime")
            case 99:
                genreArray.append("Documentary")
            case 18:
                genreArray.append("Drama")
            case 10751:
                genreArray.append("Family")
            case 14:
                genreArray.append("Fantasy")
            case 36:
                genreArray.append("History")
            case 27:
                genreArray.append("Horror")
            case 10402:
                genreArray.append("Music")
            case 9648:
                genreArray.append("Mystery")
            case 10749:
                genreArray.append("Romance")
            case 878:
                genreArray.append("Science")
            case 10770:
                genreArray.append("TV_Movie")
            case 53:
                genreArray.append("Thriller")
            case 10752:
                genreArray.append("War")
            case 37:
                genreArray.append("Western")
            default:
                genreArray.append("No genre")
            }
        }
        let genreString:String = genreArray.joined(separator: ", ")
        return genreString
    }
}



