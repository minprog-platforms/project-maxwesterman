////
////  PlaatsAdvertentie.swift
////  Geven en Krijgen
////
////  Created by Max Westerman on 07/12/2021.
////
//
//import SwiftUI
//import Photos
//import CloudKit
//
////class CloudKitPlaatsAdvertentieViewModel: ObservableObject {
////    @Published var text: String = ""
////
////    func addButtonPressed() {
////        guard !text.isEmpty else { return } // toevoegen image && !text.isEmpty
////    }
////
////    private func addItem(name: String) {
////
////    }
////
////    private func saveitem(record: CKRecord) {
////        CKContainer.default().publicCloudDatabase.save(record) { returnedRecord, returnedError in
////            <#code#>
////        }
////    }
////}
//
//// Main view
//struct PlaatsAdvertentie: View {
//    @StateObject private var vm = CloudKitPlaatsAdvertentieViewModel()
//
//    @State var selected: [UIImage] = []
//    @State var show = false
//
//    var body: some View {
//        GeometryReader{_ in
//
//            VStack {
//                imagePickerButton
//                itemImages
//                textFile
//                publishItem
//                Spacer()
//            }
//
//            // background image
//            .withDefaultBackgroundImage(opacity: 0.3)
//
//            // show pop-up screen for choosing image
//            if self.show {
//                CustomPicker(selected: self.$selected, show: self.$show)
//            }
//        }
//    }
//}
//
//struct PlaatsAdvertentie_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaatsAdvertentie()
//    }
//}
//
//extension PlaatsAdvertentie {
//
//    private var imagePickerButton: some View {
//        // Voeg een afbeelding toe
//        Button(action: {
//            self.selected.removeAll()
//            self.show.toggle()
//        }) {
//            Text("Kies afbeeldingen")
//                .foregroundColor(.white)
//        }
//        .frame(width: UIScreen.main.bounds.width - 25, height: 40)
//        .background(Color.gray)
//        .cornerRadius(10)
//        .padding(.horizontal, 20)
//
//
//
//    }
//
//    private var itemImages: some View {
//        VStack {
//            if !self.selected.isEmpty {
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 20) {
//                        Button(action: {
//                            self.show.toggle()
//                        }) {
//                            ForEach(self.selected, id: \.self){i in
//                                Image(uiImage: i)
//                                    .resizable()
//                                    .frame(width: UIScreen.main.bounds.width - 200, height: 125)
//                                    .cornerRadius(15)
//                            }
//                            Rectangle()
//                                .frame(width: UIScreen.main.bounds.width - 200, height: 125)
//                                .cornerRadius(15)
//                                .opacity(0.1)
//                                .overlay(
//                                    Image(systemName: "plus")
//                                        .resizable()
//                                        .frame(width: 25, height: 25)
//                                        .foregroundColor(.black).opacity(0.3)
//                                )
//                            }
//                        .padding(.horizontal, 20)
//                    }
//                }
//            } else {
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 20) {
//                        ForEach(0..<20){i in
//                            Button(action: {
//                                self.show.toggle()
//                            }) {
//                                Rectangle()
//                                    .frame(width: UIScreen.main.bounds.width - 200, height: 125)
//                                    .cornerRadius(15)
//                                    .opacity(0.1)
//                                    .overlay(
//                                        Image(systemName: "plus")
//                                            .resizable()
//                                            .frame(width: 25, height: 25)
//                                            .foregroundColor(.black).opacity(0.3)
//
//                                    )
//                            }
//                        }
//                    }
//                    .padding(.horizontal, 20)
//                }
//            }
//        }
//    }
//
//    private var textFile: some View {
//        // Voeg een beschrijving toe
//        TextField("Voeg een beschrijving toe...", text: $vm.text)
//            .frame(height: 55)
//            .padding(.leading)
//            .background(Color.gray.opacity(0.2))
//            .cornerRadius(10)
//        .padding(.horizontal, 20)
//    }
//
//    private var publishItem: some View {
//        // Plaats advertentie
//        Button(action: {
//
//        }) {
//            Text("Plaats advertentie")
//                .foregroundColor(.white)
//                .padding(.vertical, 10)
//                .frame(width: UIScreen.main.bounds.width / 1.5)
//        }
//        .background(Color.red)
//        .clipShape(Capsule())
//        .padding(.top, 175)
//    }
//
//}
//
//struct CustomPicker: View {
//
//    @Binding var selected: [UIImage]
//    @State var data: [Images] = []
//    @State var grid: [Int] = []
//    @Binding var show: Bool
//    @State var disabled = false
//
//
//    var body: some View {
//        GeometryReader { _ in
//            VStack {
//
//                if !self.grid .isEmpty {
//
//                    HStack {
//                        Text("Selecteer een afbeelding")
//                            .fontWeight(.bold)
//                        Spacer()
//                    }
////                    .padding(.leading)
//                    .padding(.top)
//
//                    ScrollView(.vertical, showsIndicators: false) {
//
//                        VStack(spacing: 20) {
//                            ForEach(self.grid, id: \.self) { i  in
//                                HStack(spacing: 8) {
//                                    ForEach(i..<i+3, id: \.self) { j in
//                                        HStack {
//                                            if j < self.data.count {
//                                                Card(data: self.data[j], selected: self.$selected)
//                                            }
//                                        }
//                                    }
//
////                                    if self.data.count % 3 != 0 && i == self.grid.last! {
////                                        Spacer()
////                                    }
//                                }
//                                .padding(.leading, (self.data.count % 3 != 0 && i == self.grid.last!) ? 15 : 0)
//                            }
//                        }
//                    }
//
//
//
//
//                    Button(action: {
//
//                        self.show.toggle()
//
//                    }) {
//
//                        Text("Select")
//                            .foregroundColor(.white)
//                            .padding(.vertical, 10)
//                            .frame(width: UIScreen.main.bounds.width / 2 )
//                    }
//                    .background(Color.red.opacity((self.selected.count != 0) ? 1 : 0.5))
//                    .clipShape(Capsule())
//                    .padding(.bottom, 25)
//                    .disabled((self.selected.count != 0) ? false : true)
//                }
//                else {
//
//                    if self.disabled {
//                        Text("Enable Storage Access In Settings")
//                    } else {
//                        Indicator()
//
//                    }
//                }
//            }
//            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 1.5)
////            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height - 40)
//            .background(Color.white)
//            .cornerRadius(15)
//
//        }
//        .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)
//        .onTapGesture {
//            self.show.toggle()
//        })
//        .onAppear  {
//            PHPhotoLibrary.requestAuthorization { (status) in
//                if status == .authorized {
//                    self.getAllImages()
//                    self.disabled = false
//
//                } else {
//                    print("not authorized")
//                    self.disabled = true
//                }
//            }
//        }
//    }
//
//    func getAllImages() {
//    let req = PHAsset.fetchAssets(with: .image, options: .none)
//    DispatchQueue.global(qos: .background).async {
//        req.enumerateObjects{ (asset, _, _) in
//
//            let options = PHImageRequestOptions()
//            options.isSynchronous = true
//
//            PHCachingImageManager.default().requestImage(for: asset, targetSize: .init(), contentMode: .default, options: options) { (image, _) in
//
//                let data1 = Images(image: image!, selected: false)
//                self.data.append(data1)
//            }
//
//        }
//
//        if req.count == self.data.count {
//            self.getGrid( )
//        }
//    }
//}
//
//    func getGrid() {
//        for i in stride(from: 0, to: self.data.count, by: 3) {
//            self.grid.append(i)
//        }
//    }
//
//
//}
//
//struct Images {
//    var image: UIImage
//    var selected: Bool
//}
//
//struct Card: View {
//
//    @State var data: Images
//    @Binding var selected: [UIImage]
//
//    // pop-up view image cards view
//    var body: some View {
//        ZStack {
//            Image(uiImage: self.data.image)
//                .resizable()
//
//            // select image view in pop-up
//            if self.data.selected {
//                ZStack {
//                    Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
//                    Image(systemName: "checkmark")
//                        .resizable()
//                        .frame(width: 30, height: 30)
//                        .foregroundColor(.white)
//                }
//            }
//        }
//        .frame(width: (UIScreen.main.bounds.width - 80) / 3, height: 90)
//        .onTapGesture {
//            if !self.data.selected {
//                self.data.selected = true
//                self.selected.append(self.data.image)
//            } else {
//                for i in 0..<self.selected.count {
//                    if self.selected[i] == self.data.image {
//                        self.selected.remove(at: i)
//                        self.data.selected = false
//                        return
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct Indicator: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIActivityIndicatorView {
//        let view = UIActivityIndicatorView(style: .large)
//        view.startAnimating()
//        return view
//    }
//
//    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
//
//    }
//}
