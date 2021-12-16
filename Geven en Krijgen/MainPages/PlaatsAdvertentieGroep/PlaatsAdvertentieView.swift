//
//  PlaatsAdvertentie.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 07/12/2021.
//

import SwiftUI
import Photos
import CloudKit

struct AdvertentieL {
    let id = UUID()
    var koBeschrijving: String
    var laBeschrijving: String
    
//    var image1: UIUserInterfaceIdiom
}


class CloudKitPlaatsAdvertentieViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var text: String = ""
    @Published var selected: [UIImage] = []
    @Published var kBeschrijving: [String] = []
    
    @Published var returnedItems: [AdvertentieL] = []
    
    init() {
        fetchItems()
    }
    
    
    func addButtonPressed() {
        guard !text.isEmpty else { return } // toevoegen image && !text.isEmpty
        addItem(title: title)
        
    }

    private func addItem(title: String) {
        let newItem = CKRecord(recordType: "GeK")
        newItem["KorteBeschrijving"] = title
        newItem["LangeBeschrijving"] = text
        
                
        let image1 = self.selected[0]
        let image2 = self.selected[1]
        let image3 = self.selected[2]
//        let image4 = self.selected[3]
//        let image5 = self.selected[4]
//        let image6 = self.selected[5]
//        let image7 = self.selected[6]
//        let image8 = self.selected[7]
//        let image9 = self.selected[8]
//        let image10 = self.selected[9]
        

        guard
            // 1
            let url1 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("image1"),
            let data1 = image1.jpegData(compressionQuality: 1.0),
            // 2
            let url2 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("image2"),
            let data2 = image2.jpegData(compressionQuality: 1.0),
            // 3
            let url3 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("image3"),
            let data3 = image3.jpegData(compressionQuality: 1.0)
//            // 4
//            let url4 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("image4"),
//            let data4 = image4.jpegData(compressionQuality: 1.0),
//            // 5
//            let url5 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("image5"),
//            let data5 = image5.jpegData(compressionQuality: 1.0),
//            // 6
//            let url6 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("image6"),
//            let data6 = image6.jpegData(compressionQuality: 1.0),
//            // 7
//            let url7 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("image7"),
//            let data7 = image7.jpegData(compressionQuality: 1.0),
//            // 8
//            let url8 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("image8"),
//            let data8 = image8.jpegData(compressionQuality: 1.0),
//            // 9
//            let url9 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("image9"),
//            let data9 = image9.jpegData(compressionQuality: 1.0),
//            // 10
//            let url10 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("image10"),
//            let data10 = image10.jpegData(compressionQuality: 1.0)
                else { return }

        do {
            try data1.write(to: url1)
            try data2.write(to: url2)
            try data3.write(to: url3)
//            try data4.write(to: url4)
//            try data5.write(to: url5)
//            try data6.write(to: url6)
//            try data7.write(to: url7)
//            try data8.write(to: url8)
//            try data9.write(to: url9)
//            try data10.write(to: url10)

            let asset1 = CKAsset(fileURL: url1)
            let asset2 = CKAsset(fileURL: url2)
            let asset3 = CKAsset(fileURL: url3)
//            let asset4 = CKAsset(fileURL: url4)
//            let asset5 = CKAsset(fileURL: url5)
//            let asset6 = CKAsset(fileURL: url6)
//            let asset7 = CKAsset(fileURL: url7)
//            let asset8 = CKAsset(fileURL: url8)
//            let asset9 = CKAsset(fileURL: url9)
//            let asset10 = CKAsset(fileURL: url10)
            
            newItem["image1"] = asset1
            newItem["image2"] = asset2
            newItem["image3"] = asset3
//            newItem["image4"] = asset4
//            newItem["image5"] = asset5
//            newItem["image6"] = asset6
//            newItem["image7"] = asset7
//            newItem["image8"] = asset8
//            newItem["image9"] = asset9
//            newItem["image10"] = asset10
            
            saveitem(record: newItem)
            
        } catch let error {
            print(error)
        }
        
    }

    private func saveitem(record: CKRecord) {
        CKContainer.default().publicCloudDatabase.save(record) { [weak self] returnedRecord, returnedError in
            print("Record: \(String(describing: returnedRecord))")
            print("Record: \(String(describing: returnedError))")
            
            DispatchQueue.main.async {
                self?.text = ""
                self?.title = ""
                self?.selected = []
            }
        }
    }
    
    func fetchItems() {

        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "GeK", predicate: predicate)
        let queryOperation = CKQueryOperation(query: query)

        

        if #available(iOS 15.0, *) {
            queryOperation.recordMatchedBlock = { (returnedRecordId, returnedResult) in
                switch returnedResult {
                case .success(let record):
                    guard
                        let kBeschrijving = record["KorteBeschrijving"] as? String,
                        let laBeschrijving = record["LangeBeschrijving"] as? String else { return }
                    self.returnedItems.insert(AdvertentieL(koBeschrijving: kBeschrijving, laBeschrijving: laBeschrijving), at: 0)
                    
                case .failure(let error):
                    print("error recordMatchedBlock: \(error)")
                }
            }
        } else {
            queryOperation.recordFetchedBlock = { (returnedRecord) in
                guard let kBeschrijving = returnedRecord["KorteBeschrijving"] as? String,
                      let laBeschrijving = returnedRecord["LangeBeschrijving"] as? String else { return }
                self.returnedItems.insert(AdvertentieL(koBeschrijving: kBeschrijving, laBeschrijving: laBeschrijving), at: 0)
            }
        }
        
//        if #available(iOS 15.0, *) {
//            queryOperation.queryResultBlock = { [weak self] returnedResult in
//                print("RETURNED queryResultBlock: \(returnedResult)")
////                self?.kBeschrijving = returnedItems
//            }
//        } else {
//            queryOperation.queryCompletionBlock = { [weak self] (returnedCursor, returnedError) in
//                print("RETURNED queryCompletionBlock")
////                self?.kBeschrijving = returnedItems
//
//            }
//        }


        addOperation(operation: queryOperation)

    }
        
    func addOperation(operation: CKDatabaseOperation) {
        CKContainer.default().publicCloudDatabase.add(operation)
    }
    
    
    
}

// Main view
struct PlaatsAdvertentie: View {
    @StateObject private var vm = CloudKitPlaatsAdvertentieViewModel()
    @State private var tabSelection: TabBarItem = .Profiel

    
//    @State var selected: [UIImage] = []
    @State var show = false
    
    var body: some View {
        GeometryReader{_ in
            
            VStack {
                imagePickerButton
                itemImages
                titleFile
                textFile
                publishItem
                
                Spacer()
            }
            
            // background image
            .withDefaultBackgroundImage(opacity: 0.3)

            // show pop-up screen for choosing image
            if self.show {
                CustomPicker(selected: self.$vm.selected, show: self.$show)
            }
        }
    }
}

struct PlaatsAdvertentie_Previews: PreviewProvider {
    static var previews: some View {
        PlaatsAdvertentie()
    }
}

extension PlaatsAdvertentie {

    private var imagePickerButton: some View {
                
        // Voeg een afbeelding toe
        HStack {
            Button(action: {
//                self.vm.selected.removeAll()
//                self.show.toggle()
            }) {
                Text("Kies afbeeldingen (max. 10)")
                    .foregroundColor(.black).opacity(0.6)
                    .padding(.horizontal, 20)
                Spacer()
            }
        }
    }
    
    private var itemImages: some View {
        VStack {
            if !self.vm.selected.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        Button(action: {
                            self.show.toggle()
                        }) {
                            ForEach(self.vm.selected, id: \.self){i in
                                Image(uiImage: i)
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width - 200, height: 125)
                                    .cornerRadius(15)
                            }
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width - 200, height: 125)
                                .cornerRadius(10)
                                .opacity(0.05)
                                .overlay(
                                    Image(systemName: "plus")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(.black).opacity(0.3)
                                )
                            }
                        .padding(.horizontal, 20)
                    }
                }
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<10){i in
                            Button(action: {
                                self.show.toggle()
                            }) {
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width - 200, height: 125)
                                    .cornerRadius(10)
                                    .opacity(0.05)
                                    .overlay(
                                        Image(systemName: "plus")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(.black).opacity(0.3)
                                        
                                    )
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
    
    private var titleFile: some View {
        // Voeg een beschrijving toe
        TextField("Voeg een titel toe...", text: $vm.title)
            .frame(height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.05))
            .cornerRadius(5)
        .padding(.horizontal, 20)
    }
    
    private var textFile: some View {
        // Voeg een beschrijving toe
        TextField("Voeg een beschrijving toe...", text: $vm.text)
            .frame(height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.05))
            .cornerRadius(5)
        .padding(.horizontal, 20)
    }
    
    
    
    private var publishItem: some View { 
        // Plaats advertentie
        
        Button(action: {
            vm.addButtonPressed()
        }) {
            Text("Plaats advertentie")
                .bold()

                .foregroundColor(.white)
                .padding(.vertical, 10)
                .frame(width: UIScreen.main.bounds.width / 1.5)
        }
        .frame(width: 260, height: 50)
        .background(Color.red)
        .cornerRadius(12)
        .padding(.top, 92)
    }
    
}

struct CustomPicker: View {
    
    @Binding var selected: [UIImage]
    @State var data: [Images] = []
    @State var grid: [Int] = []
    @Binding var show: Bool
    @State var disabled = false

    
    var body: some View {
        GeometryReader { _ in
            VStack {
            
                if !self.grid .isEmpty {
                    
                    HStack {
                        Text("Selecteer een afbeelding")
                            .fontWeight(.bold)
                        Spacer()
                    }
//                    .padding(.leading)
                    .padding(.top)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(spacing: 20) {
                            ForEach(self.grid, id: \.self) { i  in
                                HStack(spacing: 8) {
                                    ForEach(i..<i+3, id: \.self) { j in
                                        HStack {
                                            if j < self.data.count {
                                                Card(data: self.data[j], selected: self.$selected)
                                            }
                                        }
                                    }
                                    
//                                    if self.data.count % 3 != 0 && i == self.grid.last! {
//                                        Spacer()
//                                    }
                                }
                                .padding(.leading, (self.data.count % 3 != 0 && i == self.grid.last!) ? 15 : 0)
                            }
                        }
                    }
                    
                    
                    
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        
                        Text("Select")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .frame(width: UIScreen.main.bounds.width / 2 )
                    }
                    .background(Color.red.opacity((self.selected.count != 0) ? 1 : 0.5))
                    .clipShape(Capsule())
                    .padding(.bottom, 25)
                    .disabled((self.selected.count != 0) ? false : true)
                }
                else {
                    
                    if self.disabled {
                        Text("Enable Storage Access In Settings")
                    } else {
                        Indicator()

                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 1.5)
//            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height - 40)
            .background(Color.white)
            .cornerRadius(15)
    
        }
        .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)
        .onTapGesture {
            self.show.toggle()
        })
        .onAppear  {
            PHPhotoLibrary.requestAuthorization { (status) in
                if status == .authorized {
                    self.getAllImages()
                    self.disabled = false

                } else {
                    print("not authorized")
                    self.disabled = true
                }
            }
        }
    }
    
    func getAllImages() {
    let req = PHAsset.fetchAssets(with: .image, options: .none)
    DispatchQueue.global(qos: .background).async {
        req.enumerateObjects{ (asset, _, _) in
            
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            
            PHCachingImageManager.default().requestImage(for: asset, targetSize: .init(), contentMode: .default, options: options) { (image, _) in
                
                let data1 = Images(image: image!, selected: false)
                self.data.append(data1)
            }
            
        }
        
        if req.count == self.data.count {
            self.getGrid( )
        }
    }
}
    
    func getGrid() {
        for i in stride(from: 0, to: self.data.count, by: 3) {
            self.grid.append(i)
        }
    }
    
    
}

struct Images {
    var image: UIImage
    var selected: Bool
}

struct Card: View {
    
    @State var data: Images
    @Binding var selected: [UIImage]
    
    // pop-up view image cards view
    var body: some View {
        ZStack {
            Image(uiImage: self.data.image)
                .resizable()

            // select image view in pop-up
            if self.data.selected {
                ZStack {
                    Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
            }
        }
        .frame(width: (UIScreen.main.bounds.width - 80) / 3, height: 90)
        .onTapGesture {
            if !self.data.selected {
                self.data.selected = true
                self.selected.append(self.data.image)
            } else {
                for i in 0..<self.selected.count {
                    if self.selected[i] == self.data.image {
                        self.selected.remove(at: i)
                        self.data.selected = false
                        return
                    }
                }
            }
        }
    }
}

struct Indicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}
