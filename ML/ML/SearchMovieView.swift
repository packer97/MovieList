import SwiftUI

struct SearchMovieView: View {
    @StateObject var apiServices = ApiServices()
    @State private var searchText = ""
    @ObservedObject var base = Base.shared
    private var width: CGFloat = 120
    private var height: CGFloat = 150
        var body: some View {
            ZStack{
                ZStack{
            VStack( spacing:-10){
                SearchBar(text: $searchText, placeholder: "Search movie")
                    List{
                        ForEach(apiServices.movies){ movie in
                            ZStack{
                                if apiServices.theMovieDbDetails == nil {
                                    ProgressView().onAppear(perform: {apiServices.fetchTheMovieDbFilm(id: String(movie.id!))})}
                            NavigationLink(
                                  destination: MovieDetailsView(movie: movie)){
                                      ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color(lightBackgroundColor))
                                .cornerRadius(15)
                            HStack(spacing: 8) {
                                MovieDetailImage(urlString: movie.posterPath, width: width, height: height, cornerRadius: 10 )
                                VStack(alignment: .leading, spacing: 50.0 ) {
                                    movie.title != nil ? Text("\(movie.title!)"):Text("-")
                                    VStack(alignment: .leading, spacing: 10) {
                                        movie.originalTitle != nil ? Text("\(movie.originalTitle!)"):Text("-")
                                        movie.releaseDate != nil ? Text("\(dateFormatter(value:movie.releaseDate))"):Text("-")
                                    }
                                }//VStack
                            } //HStack
                            .padding([.top, .bottom], 8)
                            .padding(.leading, 10)
                        }//ZStack
                        }
                        }
                        }//ForEach
                        .padding([.top, .bottom], 10)
                        .padding([.leading, .trailing], 10)
                        if apiServices.currentPage < apiServices.totalPages {
                            Text("Fetching more data")
                                .onAppear(perform:{
                                    apiServices.currentPage = apiServices.currentPage + 1
                                    apiServices.fetchFilms(forFilm: self.searchText)
                                } )
                        }
                    }//List
                    .listStyle(PlainListStyle())
                    .onChange (of: searchText){ newValue in
                        apiServices.fetchFilms(forFilm: self.searchText)
                        apiServices.currentPage = 1
                        
                    }
                    .padding(.horizontal, 0)
                    .padding(.vertical, 0)
                }
            .navigationBarTitle("Search Movie")
            .navigationBarTitleDisplayMode(.inline)
                }.background(Color.white)
            }.background(Color(navigationBackgroundColor).edgesIgnoringSafeArea(.top))
//                .onDisappear{self.base.getItems()}
        } //View
        
}

struct SearchMovieView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMovieView()
    }
}
