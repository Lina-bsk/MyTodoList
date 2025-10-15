
import SwiftUI

struct ContentView: View {
    
    @Environment(ListViewModel.self) private var listModel
    
    var body: some View {
        
        NavigationStack {
            VStack {
                if listModel.items.isEmpty {
                    EmptyView()
                } else {
                    List {
                        ForEach(listModel.items) { item in
                            RowView(item: item)
                                .onTapGesture(perform: {
                                    withAnimation(.easeIn) {
                                        listModel.itemChecked(item: item)
                                    }
                                })
                        }
                        .onDelete(perform: listModel.deleteItem)
                        .onMove(perform: listModel.moveItem)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Todo list")
            
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddView()
                    } label: {
                        Text("Add")
                    }
                }
            })
        }
    }
}

#Preview {
    ContentView()
        .environment(ListViewModel())
}
