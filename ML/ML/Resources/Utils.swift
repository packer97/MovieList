import Foundation
import SwiftUI

func textFormatter ( item: String?, category:String?) -> String{
    var txt:String?
    if item != nil && category != nil {
        txt = "\(category!): \(item!)"} else if item != nil{
        txt = "\(item!)"
    }else {txt = "-"}
    return txt!
}

func dateFormatter(value:String?)->String {
    var formatToStringDate = "-"
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "YYYY-MM-dd"
    if let date = dateFormatter.date(from: value!) {
        print(date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        formatToStringDate = dateFormatter.string(from: date )
        print(formatToStringDate)
    }
    return formatToStringDate
}

func goHome() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: MovieCollectionView())
            window.makeKeyAndVisible()
        }
    }
func ratingText(rating: Double)->String {
    let intRating = Int(rating)
    let ratingText = (0..<intRating).reduce("") { (acc, _) -> String in
        return acc + "★"
    }
    return ratingText
}
