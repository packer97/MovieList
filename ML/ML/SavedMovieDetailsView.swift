import SwiftUI

struct SavedMovieDetailsView: View {
    var genres = Genres()
    private let width: CGFloat = 250
    private let height: CGFloat = 350
    var savedMovie: SavedResultData
    @ObservedObject var base = Base.shared
    var index:Int?
    var body: some View {
        ZStack{
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
                    MovieDetailImage(urlString: savedMovie.posterPath!, width: width, height: height, cornerRadius: 10 )
                    Text(ratingText(rating: savedMovie.voteAverage!)).foregroundColor(Color(titleColor))
                    VStack(alignment: .leading , spacing: 10){
                    Text(textFormatter(item: savedMovie.title, category: nil)).foregroundColor(Color(textColor)).font(.subheadline)
                    Text(textFormatter(item: genres.getGenres(numbers: savedMovie.genreIDS!), category:"Жанр"))
                        .foregroundColor(Color(textColor)).font(.subheadline)
                    savedMovie.director != nil ? Text(textFormatter(item:savedMovie.director,category:"Режиссёр"))
                        .foregroundColor(Color(textColor)).font(.subheadline):Text("-")
                    savedMovie.actors != nil ? Text(textFormatter(item: savedMovie.actors, category: "Актёры"))
                        .foregroundColor(Color(textColor)).font(.subheadline):Text("-")
                    Text(textFormatter(item: savedMovie.originalTitle!, category: "Оригинальное название"))
                        .foregroundColor(Color(textColor)).font(.subheadline)
                    Text(textFormatter(item: savedMovie.releaseDate!, category: "Дата выхода"))
                        .foregroundColor(Color(textColor)).font(.subheadline)
                    Text(textFormatter(item: savedMovie.overview!, category: "Описание")).foregroundColor(Color(textColor)).font(.subheadline)
                    }.ignoresSafeArea(.all)
                    let containArray = base.savedMovies.filter{$0.id == savedMovie.id}
                    if containArray.capacity == 1 {
                            Text("Удалить").padding()
                            .background(Color(titleColor))
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(25)
                            .shadow(radius:10)
                            .simultaneousGesture(TapGesture().onEnded{
                                base.deleteMovie(index:index!)
                                    goHome()
                            
                            })
                    }
                } //VStack
                    .padding(20)
                    .navigationBarTitle(Text("Details"), displayMode: .inline)
                    .frame(minWidth: 50, maxWidth: .infinity, minHeight: 50)
            }//ScrollView
        }//ZStack
        .onAppear{print(">>>>>get \(index!) index in SavedMovieDetailsView")}
    }//View

}
//struct SavedMovieDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedMovieDetailsView(movie: sampleMovie, index: 0)
//    }
//}
