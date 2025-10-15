
import SwiftUI

@main
struct MyTodoListApp: App {
    
    @State var modelItem = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(modelItem)
    }
}
