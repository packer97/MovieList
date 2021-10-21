import SwiftUI

struct ApplicationOwnerView: View {
    @State private var searchText = ""
    @Environment(\.presentationMode) var presentationMode

        var body: some View {
            ZStack(alignment: .center){Color(navigationBackgroundColor).ignoresSafeArea(.all)
            ScrollView{Color(navigationBackgroundColor).ignoresSafeArea(.all)
            VStack(alignment: .center, spacing: 2){
                Text("Серов Станислав").font(.system(size: 25)).foregroundColor(Color(titleColor)).bold().padding(.vertical,20)
                Text("Мужчина | 06.04.1997").font(.system(size: 15)).foregroundColor(Color(textColor))
                Image("photo").resizable().frame(width: 175, height: 220, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle()
                    .stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                    .padding(.vertical, 30)
                VStack(alignment: .center, spacing: 5){
                Text("+79171029604").font(.system(size: 15)).foregroundColor(Color(textColor))
                Text("serovstanislav@yandex.ru").font(.system(size: 15)).foregroundColor(Color(textColor))
                    HStack(alignment: .center, spacing: 70){
                        Button {
                                let tel = "tel://"
                                let strNumber = "89171029604"
                                let formattedString = tel + strNumber
                                guard let url = URL(string: formattedString) else { return }
                                UIApplication.shared.open(url)
                        } label: {
                            ZStack(){
                                Circle().foregroundColor(Color.white).frame(width: 50,height: 50)
                            Image(systemName: "phone.fill")
                                    .resizable().frame(width: 30, height: 25)
                                    .foregroundColor(Color(titleColor)).scaleEffect()
                            }
                        }
                        Button {
                            let tel = "mailto:"
                            let strNumber = "serovstanislav@yandex.ru"
                            let formattedString = tel + strNumber
                            guard let url = URL(string: formattedString) else { return }
                            UIApplication.shared.open(url)
                        } label: {
                            ZStack(){
                                Circle().foregroundColor(Color.white).frame(width: 50,height: 50)
                                Image(systemName: "envelope.fill")
                                    .resizable().frame(width: 30, height: 25)
                                    .foregroundColor(Color(titleColor))
                            }
                        }
                    }.ignoresSafeArea(.all)
                Text("Закрыть")
                .frame(width: 160, height: 50)
                .background(Color(titleColor))
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(25)
                .shadow(radius:10)
                .simultaneousGesture(TapGesture().onEnded{
                    presentationMode.wrappedValue.dismiss()
                })
                }
            }//
            }//Scroll
            .ignoresSafeArea(.all)
            }//Z
            .ignoresSafeArea(.all)
        }//View
    
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationOwnerView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

