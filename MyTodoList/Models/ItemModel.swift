
import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isChecked: Bool
    var creatingDate: Date
    
    init(id: String = UUID().uuidString, title: String, isChecked: Bool, creatingDate: Date = Date()) {
        self.id = id
        self.title = title
        self.isChecked = isChecked
        self.creatingDate = creatingDate
    }
    
    func ifChecked() -> ItemModel {
        return ItemModel(id: id, title: title, isChecked: !isChecked, creatingDate: creatingDate)
    }
    
    func dateItem() -> String {
        let formatter = DateFormatter.localizedString(from: creatingDate, dateStyle: .short, timeStyle: .short)
        
        return formatter
    }
}
