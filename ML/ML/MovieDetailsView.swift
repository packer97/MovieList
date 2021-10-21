import SwiftUI

struct MovieDetailsView: View {
    @StateObject var apiServices = ApiServices()
    @ObservedObject var base = Base()
    private let width: CGFloat? = 250
    private let height: CGFloat? = 350
    var genres = Genres()
    var movie: ResultData
    var body: some View {
        ZStack{
            if apiServices.theMovieDbDetails == nil {
                ProgressView().onAppear(perform: {apiServices.fetchTheMovieDbFilm(id: String(movie.id!))}) }
            VStack(alignment: .center, spacing: -90){
                Rectangle()
                    .fill(Color(navigationBackgroundColor))
                    .frame( height: 200)
                    .edgesIgnoringSafeArea([.top, .leading, .trailing])
                Rectangle()
                    .fill(Color(lightBackgroundColor))
                    .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
            }
            ScrollView{
                VStack(alignment: .center , spacing: 10){
                    MovieDetailImage(urlString: movie.posterPath, width: width!, height: height!, cornerRadius: 10 )
                    Text(ratingText(rating: movie.voteAverage!)).foregroundColor(Color(titleColor))
                    VStack(alignment: .leading , spacing: 10){
                    Text(textFormatter(item: movie.title, category: nil)).foregroundColor(Color(textColor)).font(.subheadline)
                    Text(textFormatter(item: genres.getGenres(numbers: movie.genreIDS!), category:"Жанр"))
                        .foregroundColor(Color(textColor)).font(.subheadline)
                    apiServices.omdbMovie != nil && apiServices.omdbMovie!.director != nil ? Text(textFormatter(item:apiServices.omdbMovie!.director,category:"Режиссёр"))
                        .foregroundColor(Color(textColor)).font(.subheadline):Text("-")
                    apiServices.omdbMovie != nil && apiServices.omdbMovie!.actors != nil ? Text(textFormatter(item: apiServices.omdbMovie!.actors, category: "Актёры"))
                        .foregroundColor(Color(textColor)).font(.subheadline):Text("-")
                    Text(textFormatter(item: movie.originalTitle, category: "Оригинальное название"))
                        .foregroundColor(Color(textColor)).font(.subheadline)
                    Text(textFormatter(item: movie.releaseDate, category: "Дата выхода"))
                        .foregroundColor(Color(textColor)).font(.subheadline)
                    Text(textFormatter(item: movie.overview, category: "Описание")).foregroundColor(Color(textColor)).font(.subheadline)
                    }.ignoresSafeArea(.all)
                    let containArray = base.savedMovies.filter{$0.id == movie.id}
                    if containArray.capacity != 1 {
                            Text("Добавить в избранное").padding()
                            .background(Color(titleColor))
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(25)
                            .shadow(radius:10)
                            .simultaneousGesture(TapGesture().onEnded{
                                base.addMovie(id: movie.id, imdbID: nil, posterPath: movie.posterPath, releaseDate: movie.releaseDate, title: movie.title, originalTitle: movie.originalTitle, overview: movie.overview, genreIDS: movie.genreIDS, popularity: movie.popularity, voteAverage: movie.voteAverage, voteCount: movie.voteCount, year: apiServices.omdbMovie!.year, director: apiServices.omdbMovie!.director, writer: apiServices.omdbMovie!.writer, actors: apiServices.omdbMovie!.actors, runtime: apiServices.theMovieDbDetails!.runtime, genres: genres.getGenres(numbers: movie.genreIDS!))
                                goHome()
                            })
                    } else {Text("В избранном").padding()
                            .background(Color(.gray))
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(25)
                            .shadow(radius:10)}
                } //VStack
                    .padding(20)
                    .navigationBarTitle(Text("Details"), displayMode: .inline)
                    .frame(minWidth: 50, maxWidth: .infinity, minHeight: 50)
            }//ScrollView
        }//ZStack
    }//View
}


struct M: PreviewProvider {
    var movie: ResultData
    static var previews: some View {
        MovieDetailsView( movie: sampleMovie)
    }
}
