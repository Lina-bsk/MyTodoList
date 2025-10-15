
import SwiftUI

struct AddView: View {
    @Environment(ListViewModel.self) private var listViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var textField = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TextField("Add new note here ...", text: $textField)
                        .padding()
                        .frame(height: 55)
                        .background(Color(UIColor.placeholderText))
                        .clipShape(.rect(cornerRadius: 10))
                    
                    Button(action: {
                        addNewItem()
                    }, label: {
                        Text("Save".uppercased())
                            .foregroundStyle(Color.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .clipShape(.rect(cornerRadius: 10))
                    })
                }
                .padding()
                .alert("The note should be a little longer", isPresented: $showAlert) {
                    Button("Ok") { }
                }
            }
            .navigationTitle("Add new item ✏️")
        }
    }
    
    func addNewItem() {
        if textField.count > 1 {
            listViewModel.addItem(text: textField)
            dismiss()
        } else {
            showAlert.toggle()
        }
    }
}

#Preview {
    AddView()
        .environment(ListViewModel())
}
