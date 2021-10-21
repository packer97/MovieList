import SwiftUI

struct MovieCollectionView: View {
    init() {
        UINavigationBar.appearance().backgroundColor = navigationBackgroundColor
        UINavigationBar.appearance().tintColor = titleColor
        UINavigationBar.appearance().barTintColor = navigationBackgroundColor
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: textColor]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: textColor]
    }
    @ObservedObject var base = Base.shared
    @State private var width: CGFloat = UIScreen.main.bounds.width/2.1
    @State private var showSheet = false
    var layout = [GridItem(.adaptive(minimum: 180))]
    var body: some View {
                NavigationView{
                    ZStack{Color(navigationBackgroundColor).edgesIgnoringSafeArea(.top)
                        ZStack{Color.white.edgesIgnoringSafeArea(.bottom)
                        ScrollView{
                            LazyVGrid(columns:layout, alignment: .center, spacing: 0, content: {
                                ForEach(base.savedMovies.indices){ movie in
                                        NavigationLink(
                                            destination: SavedMovieDetailsView(savedMovie: base.savedMovies[movie], index: movie)
                                                .environmentObject(base)
                                        ){
                                            MovieCollectionCell(title: "\(base.savedMovies[movie].title!)",index: movie, width: 190, height: 260)
                                        }
                                    .onAppear{print(">>>>>get \(movie) index in MovieCollectionView")}
                                }//ForEach
                            })//VGrid
                                .padding(.all, 3)
                                .animation(.interactiveSpring())
                        }//ScrollView
                        .navigationBarTitle("Movie List")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(
                            leading:Button {
                                showSheet = true
                            } label: {
                                Image(systemName: "person.circle")
                            }.sheet(isPresented: $showSheet, content: {
                                ApplicationOwnerView()
                                }),
                            trailing: Button(action: {}, label: {
                                NavigationLink(destination: SearchMovieView()) {
                                    Image(systemName: "magnifyingglass")
                                }
                        }))
                        }//ZStack
                    }//ZStack
                }//NavigationView
                .navigationBarHidden(true)
    }//View
}

struct MovieCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCollectionView()
    }
}
