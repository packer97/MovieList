import SwiftUI

@main
struct MLApp: App {
    let persistenceController = PersistenceController.shared
    @EnvironmentObject var base:Base

    var body: some Scene {
        WindowGroup {
            MovieCollectionView()
                .environmentObject(Base())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
