
import Foundation

@Observable class ListViewModel {
 
    @ObservationIgnored let keyValue = "key_list"
    
    var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    
    init() {
        loadItems()
    }
    
    func loadItems() {
        guard let savedItems = UserDefaults.standard.data(forKey: keyValue) else { return }
        if let decodeData = try? JSONDecoder().decode([ItemModel].self, from: savedItems) {
            items = decodeData
        }
    }
    
    func addItem(text: String) {
        let newItem = ItemModel(title: text, isChecked: false)
        items.append(newItem)
    }
    
    func deleteItem(item: IndexSet) {
        items.remove(atOffsets: item)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func saveItem() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: keyValue)
        }
    }
    
    func itemChecked(item: ItemModel) {
        if let indexItem = items.firstIndex(where: { $0.id == item.id }) {
            items[indexItem] = item.ifChecked()
        }
    }
}
