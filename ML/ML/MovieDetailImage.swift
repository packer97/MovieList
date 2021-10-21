import SwiftUI

struct MovieDetailImage: View {
    
    @State var data: Data?
    var urlString: String?
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    var body: some View {

        if let data = data, let uiImage = UIImage(data: data){
            
            Image(uiImage: uiImage)
                                                .resizable()
                                                .cornerRadius(cornerRadius)
                                                .padding(.trailing, 0.0)
                                                .frame(width: width, height: height, alignment: .center)
                                                .blur(radius: 0.5)
                                                .shadow(color: Color.primary.opacity(0.3), radius: 5)

            
        }else{
            Image(systemName: "video")
                                                .resizable()
                                                .cornerRadius(cornerRadius)
                                                .padding(.trailing, 0.0)
                                                .frame(width: width, height: height, alignment: .center)
                                                .blur(radius: 0.5)
                                                .shadow(color: Color.primary.opacity(0.3), radius: 5)
                                                .onAppear{
                                                    getImage()
                                                }
        }
    }

    func getImage(/*imageUrl: String*/) {
        if urlString != nil{
            let imageUrlString = "\(imageDomainTheMovieDb)/t/p/w500/\(urlString!)"
            guard let url = URL(string: imageUrlString) else { return }
            let session = URLSession.shared
            session.dataTask(with: url) {(data, responce, error) in
                if let data = data{
                    
                    DispatchQueue.main.async {
                                    self.data = data
                    }
                }
            }.resume()
        }
    }
}
