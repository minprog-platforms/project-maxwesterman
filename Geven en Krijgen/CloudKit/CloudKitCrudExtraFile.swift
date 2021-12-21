////
////  CloudKitCrud.swift
////  Geven en Krijgen
////
////  Created by Max Westerman on 10/12/2021.
////
//
//import SwiftUI
//import CloudKit
//
//struct VoorwerpModel: Hashable {
//    let name: String
//    let record: CKRecord
//}
//
//class CloudKitCrudViewModel: ObservableObject {
//
//    @Published var text: String = ""
//    @Published var voorwerpen: [VoorwerpModel] = []
//
//    init() {
//        fetchItems()
//    }
//
//
//
//    func addButtonPressed() {
//        guard !text.isEmpty else { return }
//        addItem(name: text)
//    }
//
//    private func addItem(name: String) {
//        let nieuwVoorwerp = CKRecord(recordType: "Voorwerpen")
//        nieuwVoorwerp["name"] = name
//        saveItem(record: nieuwVoorwerp)
//    }
//
//    private func saveItem(record: CKRecord) {
//        CKContainer.default().publicCloudDatabase.save(record) { [weak self] returnedRecord, returnedError in
//            print("Record: \(returnedRecord) ")
//            print("Error: \(returnedError)")
//
//            DispatchQueue.main.async {
//                self?.text = ""
//                self?.fetchItems()
//            }
//        }
//
//    }
//
//
//    func fetchItems() {
//
//        let predicate = NSPredicate(value: true)
//        let query = CKQuery(recordType: "Voorwerpen", predicate: predicate)
//        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
//        let queryOperation = CKQueryOperation(query: query)
////        queryOperation.resultsLimit = 100 // Max items = 100
//
//        var returnedItems: [VoorwerpModel] = []
//
//        if #available(iOS 15.0, *) {
//            queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
//                switch returnedResult {
//                case .success(let record):
//                    guard let name = record["name"] as? String else { return }
//                    returnedItems.append(VoorwerpModel(name: name, record: record))
////                    record.creationDate
//                case .failure(let error):
//                    print("Error recordMatchedBlock: \(error)")
//                }
//            }
//        } else {
//            queryOperation.recordFetchedBlock = { (returnedRecord) in
//                guard let name = returnedRecord["name"] as? String else { return }
//                returnedItems.append(VoorwerpModel(name: name, record: returnedRecord))
//            }
//        }
//
//
//        if #available(iOS 15.0, *) {
//            queryOperation.queryResultBlock = { [weak self] returnedResult in
//                print("RETURNED queryResultBlock: \(returnedResult)")
//                DispatchQueue.main.async {
//                    self?.voorwerpen = returnedItems
//                }
//
//            }
//        } else {
//            queryOperation.queryCompletionBlock = { [weak self] (returnedCursor, returnederror) in
//                print("RETURNED queryCompletionBlock")
//                DispatchQueue.main.async {
//                    self?.voorwerpen = returnedItems
//                }
//            }
//        }
//
//        addOperation(operation: queryOperation)
//    }
//
//    func addOperation(operation: CKDatabaseOperation) {
//        CKContainer.default().publicCloudDatabase.add(operation)
//    }
//
//    func updateVoorwerp(voorwerp: VoorwerpModel) {
//        let record = voorwerp.record
//        record["name"] = "NEW Name!!!"
//        saveItem(record: record)
//
//
//    }
//
//    func deleteVoorwerp(indexSet: IndexSet) {
//        guard let index = indexSet.first else { return }
//        let voorwerpen = voorwerpen[index]
//        let record = voorwerpen.record
//
//        CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { [weak self] returnedRecordID, returnedError in
//            DispatchQueue.main.async {
//                self?.voorwerpen.remove(at: index)
//            }
//        }
//    }
//}
//
//struct CloudKitCrud: View {
//
//    @StateObject private var vm = CloudKitCrudViewModel()
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                header
//                textField
//                addButton
//                Spacer()
//
//                List{
//                    ForEach(vm.voorwerpen, id: \.self) { voorwerp in
//                        Text(voorwerp.name)
//                            .onTapGesture {
//                                vm.updateVoorwerp(voorwerp: voorwerp)
//                            }
//                    }
//                    .onDelete(perform: vm.deleteVoorwerp)
//                }
//                .listStyle(PlainListStyle())
//            }
//            .padding()
//            .navigationBarHidden(true)
//
//        }
//    }
//}
//
//struct CloudKitCrud_Previews: PreviewProvider {
//    static var previews: some View {
//        CloudKitCrud()
//    }
//}
//
//
//
//
//extension CloudKitCrud {
//
//    private var header: some View {
//        Text("CloudKitCrud")
//            .font(.headline)
//            .underline()
//
//    }
//
//    private var textField: some View {
//        TextField("Add something here...", text: $vm.text)
//            .frame(height: 55)
//            .background(Color.gray.opacity(0.4))
//            .cornerRadius(10)
//    }
//
//    private var addButton: some View {
//        Button {
//            vm.addButtonPressed()
//        } label: {
//            Text("Add")
//                .font(.headline)
//                .foregroundColor(.white)
//                .frame(height: 55)
//                .frame(maxWidth: .infinity)
//                .background(Color.pink)
//                .cornerRadius(10)
//        }
//    }
//}

