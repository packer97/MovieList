import SwiftUI

struct MovieCollectionCell: View {
    @ObservedObject var base = Base.shared
    let title:String?
    let index:Int?
    var width: CGFloat?
    var height: CGFloat?
    var body: some View {
        ZStack(alignment:.bottom ) {
            MovieDetailImage(urlString: base.savedMovies[index!].posterPath, width: width!, height: height!, cornerRadius: 0 )
            ZStack(alignment: .center){
                    VStack(alignment: .center, spacing: 2){
                        MovieCollectionCellTitle(base:base, width:width!, index: index).frame(width:width, height: 45, alignment: .topLeading).padding(.horizontal,2)
                        MovieCollectionCellYearRuntimeRating(base:base, width:width!, index: index).padding(.horizontal,2)
                    }
                    .frame(minWidth: width, idealWidth: width, maxWidth: width, minHeight: 40, idealHeight: 50, maxHeight: 85, alignment: .topLeading)
            }.background(Color(.gray).opacity(0.85))
            
        }
    }
}
struct MovieCollectionCellTitle: View {
    var base:Base
    var width: CGFloat?
    var index: Int?
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            if base.savedMovies[index!].title != nil && base.savedMovies[index!].genres != nil {
                Text("\(base.savedMovies[index!].title!)")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .font(.system(size: 13))
            } else {
                Text("-").multilineTextAlignment(.leading)
                    .font(.subheadline)
                    .foregroundColor(Color.red)
            }
            MovieCollectionCellGenre(base:base, width:width!, index: index)
        }
    }
}
struct MovieCollectionCellGenre: View {
    var base:Base
    var width: CGFloat?
    var index: Int?
    var body: some View {
        if base.savedMovies[index!].genres != nil{
            Text("\(base.savedMovies[index!].genres!)")
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .font(.system(size: 10))
        } else {
            Text("-").multilineTextAlignment(.leading)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.red)
        }
    }
}
struct MovieCollectionCellYearRuntimeRating: View {
    var base: Base
    var width: CGFloat?
    let index:Int?
    var body: some View {
            HStack(alignment:.center, spacing: 23){
                base.savedMovies[index!].runtime != nil ? Text("\(base.savedMovies[index!].runtime!) m")
                    .foregroundColor(.white)
                    .font(.subheadline)
                :Text("-")
                    .font(.subheadline)
                    .foregroundColor(Color.red)
                base.savedMovies[index!].year != nil ? Text("\(base.savedMovies[index!].year!)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                :Text("-")
                    .font(.subheadline)
                    .foregroundColor(Color.red)
                base.savedMovies[index!].voteAverage != nil ? Text("\(ratingText(rating:base.savedMovies[index!].voteAverage!))")
                        .foregroundColor(.white)
                        .font(.subheadline)
                    :Text("-")
                        .font(.subheadline)
                        .foregroundColor(Color.red)
            }.frame(width:width, height: 40, alignment: .topLeading)
    }
}
