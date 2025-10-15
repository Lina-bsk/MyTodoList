
import SwiftUI

struct RowView: View {
    var item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isChecked ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isChecked ? Color.green : Color.red)
            
            Text(item.title)
            
            Spacer()
            
            Text(item.dateItem())
                .foregroundStyle(Color.secondary)
                .font(.caption)
        }
        .font(.title2)
        .padding(.vertical, 5)
    }
}

#Preview {
    Group {
        RowView(item: ItemModel(title: "Note", isChecked: true))
        RowView(item: ItemModel(title: "second note", isChecked: false))
    }
}
