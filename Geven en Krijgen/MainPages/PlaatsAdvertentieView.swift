//
//  PlaatsAdvertentie.swift
//  Geven en Krijgen
//
//  Created by Max Westerman on 07/12/2021.
//
//  This 'PlaatsAdvertentie' file is in the current app the most advanced file.
//  In this file images and text (short and long description) can be uploaded to the shared cloud
//  for later in app use. This way, users can upload a advertisement.
//

import SwiftUI
import Photos
import CloudKit

//  Struct 'AdvertentieL' is a struct that keeps track of information of a single users advertisement.

struct AdvertentieL {
    let id = UUID()
    var koBeschrijving: String
    var laBeschrijving: String
    let imageURL1: URL?
    let imageURL2: URL?
    let imageURL3: URL?
}

//  Class 'CloudKitPlaatsAdvertentieViewModel' is a class with multiple functions that toghether
//  make sure a advertisement will be uploaded to the cloud once the button is pressed.

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
        
        
        var selected = [UIImage?](repeating: nil, count: 10)
        
        for (i,image) in self.selected.enumerated() {
            selected[i] = image
        }
//        print(selected) // optional
        
        for imageNumber in 0..<9 {
            guard
                let image = selected[imageNumber],
                let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("image\(imageNumber+1)"),
                let data = image.jpegData(compressionQuality: 1.0)
            else { continue }

        
            do {
                try data.write(to: url)
            
                let asset = CKAsset(fileURL: url)
                
                newItem["image\(imageNumber+1)"] = asset
            } catch let error {
                print(error)
            }
            
        }
//        print(newItem) // optional
        saveitem(record: newItem)
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
                        let kBeschrijving = record["KorteBeschrijving"] as? String else { return }
                        let laBeschrijving = record["LangeBeschrijving"] as? String
                        let imageAsset1 = record["image1"] as? CKAsset
                        let imageURL1 = imageAsset1?.fileURL
                        let imageAsset2 = record["image2"] as? CKAsset
                        let imageURL2 = imageAsset2?.fileURL
                        let imageAsset3 = record["image3"] as? CKAsset
                        let imageURL3 = imageAsset3?.fileURL
                    
                    self.returnedItems.insert(AdvertentieL(koBeschrijving: kBeschrijving, laBeschrijving: laBeschrijving!, imageURL1: imageURL1, imageURL2: imageURL2, imageURL3: imageURL3), at: 0)
                    
                case .failure(let error):
                    print("error recordMatchedBlock: \(error)")
                }
            }
        } else {
            queryOperation.recordFetchedBlock = { (returnedRecord) in
                guard
                    let kBeschrijving = returnedRecord["KorteBeschrijving"] as? String else { return }
                    let laBeschrijving = returnedRecord["LangeBeschrijving"] as? String
                    let imageAsset1 = returnedRecord["image1"] as? CKAsset
                    let imageURL1 = imageAsset1?.fileURL
                    let imageAsset2 = returnedRecord["image2"] as? CKAsset
                    let imageURL2 = imageAsset2?.fileURL
                    let imageAsset3 = returnedRecord["image3"] as? CKAsset
                    let imageURL3 = imageAsset3?.fileURL
            
                self.returnedItems.insert(AdvertentieL(koBeschrijving: kBeschrijving, laBeschrijving: laBeschrijving!, imageURL1: imageURL1, imageURL2: imageURL2, imageURL3: imageURL3), at: 0)
            }
        }
        addOperation(operation: queryOperation)
    }

    func addOperation(operation: CKDatabaseOperation) {
        CKContainer.default().publicCloudDatabase.add(operation)
    }
}

//  Struct 'PlaatsAdvertentie' is the main view. In this view, all the view components of placing a
//  advertisement are summed. Also there is a extention of the struct 'PlaatsAdvertentie'.

struct PlaatsAdvertentie: View {
    
    @StateObject private var vm = CloudKitPlaatsAdvertentieViewModel()
    @State private var tabSelection: TabBarItem = .Profiel
    @State var show = false
    
    var body: some View {
        GeometryReader{_ in
            
            VStack {
                imagePickerText
                itemImages
                titleFile
                textFile
                publishItem
                Spacer()
            }
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

//  This is a extension of the struct 'PlaatsAdvertentie'

extension PlaatsAdvertentie {
    
    // simple line of text that says 'choose pictures'
    private var imagePickerText: some View {
        HStack {
            Text("Kies afbeeldingen (max. 10)")
                .foregroundColor(.black).opacity(0.6)
                .padding(.horizontal, 20)
            Spacer()
        }
    }
    
    // choose picture buttons
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
    
    // add a short description (text)
    private var titleFile: some View {
        // Voeg een beschrijving toe
        TextField("Voeg een titel toe...", text: $vm.title)
            .frame(height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.05))
            .cornerRadius(5)
        .padding(.horizontal, 20)
    }
    
    // add a long description (text)
    private var textFile: some View {
        // Voeg een beschrijving toe
        TextField("Voeg een beschrijving toe...", text: $vm.text)
            .frame(height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.05))
            .cornerRadius(5)
        .padding(.horizontal, 20)
    }
    
    // button to publish advertisement
    private var publishItem: some View {
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

//  This struct 'CustomPicker'

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
                } else {
                    if self.disabled {
                        Text("Enable Storage Access In Settings")
                    } else {
                        Indicator()
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 1.5)
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
            self.getGrid()
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

//  Struct 'Card' is a view that pops-up when the user presses on the plus (or image) icon.
//  Here user can choose which images they want to upload to the app.

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

// Struct 'Indicator' is a IndicatorView that starts animating when called for.

struct Indicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}
