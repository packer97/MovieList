import Foundation
import UIKit

let domainTheOmdb = "https://www.omdbapi.com/"
let theOmdbApiKey = "apikey=ef3604b5"


let domainTheMovieDb = "https://api.themoviedb.org/"
let imageDomainTheMovieDb = "https://image.tmdb.org"
let theMovieDbApiKey = "api_key=0f43df81b3b71e152691fb0b240773b0"

let navigationBackgroundColor = UIColor(red: 232/255, green: 224/255, blue: 214/255, alpha: 1)
let lightBackgroundColor = UIColor(red: 246/255, green: 238/255, blue: 228/255, alpha: 1)
let titleColor = UIColor(red: 225/255, green: 117/255, blue: 92/255, alpha: 1)
let textColor = UIColor(red: 56/255, green: 68/255, blue: 88/255, alpha: 1)

let sampleMovie = ResultData(id: 671, adult: false, backdropPath:"/t3LicFpYHeYpwqm7L5wDpd22hL5.jpg",
                             genreIDS: [12,14], originalLanguage: "en", originalTitle: "Harry Potter and the Philosopher's Stone", overview: "Обычный лондонский мальчик Гарри Поттер на 11-м году жизни узнает, что он — осиротевший сын двух могущественных волшебников, и сам обладает магической силой. В Хогвартской школе чародейства и волшебства Гарри попадает в водоворот невероятных приключений. Он изучает квиддич — спорт высшего пилотажа, играет в захватывающую игру живыми шахматными фигурами, встречается с Темным Волшебником, который хочет его уничтожить.", popularity: 223.414, posterPath: "/vkgM120mI0RH07njaFFlzG8wU4y.jpg", releaseDate: "2001-11-16", title: "Гарри Поттер и философский камень", video: false, voteAverage: 7.9, voteCount:21051)
