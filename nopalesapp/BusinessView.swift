//
//  BusinessView.swift
//  nopalesapp
//
//  Created by Abe Molina on 2/6/23.
//
import MapKit
import SwiftUI

struct BusinessView: View {
    
    var store:Store
    
    var eggShell = #colorLiteral(red: 0.9302913547, green: 0.9253246188, blue: 0.916793704, alpha: 1)
    
//    Map Code
    @State private var region =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.3309, longitude: -83.0479), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
//    TextField Strings
    @State var reviews: String = ""
    
//    Function that allows apple maps to open from mapkit view
    func openMaps() {
        
        let latitude = 42.3309
        let longitude = -83.0479
        
        let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
        
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            
        }
    }
    
    var body: some View {
        
        ZStack {
            
            Color(eggShell)
                .ignoresSafeArea()
            
            VStack {
                
                HStack(alignment: .center, spacing: 50) {
                    Text(store.storeName)
                        .font(.system(size: 33))                        .foregroundColor(.black)
                        .font(.headline)
//                        .padding()
                }
                
                ScrollView {
                    
                    //                All business info and pictures
                    VStack {
                        
                        Spacer()
                        Image(store.imageName)
                            .resizable()
                            .frame(width: 420, height: 800)
                            .padding(.bottom)
                        HStack {
//                            Image("Rest2")
//                                .frame(width: 210)
//                                .padding()
                            Spacer()
                            Text("This store is a store that sells store things for stores that support stores inside of stores, these stores pride themsevles designing their stores with traditional store architecture as it represents them as a dime store that supports stores that support outside stores outside of stores inside of bigger stores to store things in storage. ")
                                .foregroundColor(.black)
                                .padding(.bottom)
                            Spacer()
                        }
                        
                        //                    Map View under all business information
                        Button {
                            openMaps()
                        } label: {
                            Map(coordinateRegion: $region)
                                .frame(width: 420, height: 180)
                                .border(.black)
                                .cornerRadius(8)
                        }
                        
                        
                        Divider()
                            .frame(height: 1)
                            .overlay(.black)
                        
                        //                    Hyperlinks under map in an HStack
                        HStack {
                            //                        Globe symbol
                            Link(destination: URL(string: "https://www.eatdimestore.com")!, label: {
                                Image(systemName: "network")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .foregroundColor(.black)
                                    .padding()
                            })
                            //                        Share symbol
                            ShareLink(item: /*@START_MENU_TOKEN@*/URL(string: "https://developer.apple.com/xcode/swiftui")!/*@END_MENU_TOKEN@*/)
                                .frame(width: 175, height: 70)
                                .foregroundColor(.black)
                        }
                        
                        Divider()
                            .frame(height: 1)
                            .overlay(.black)
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill((Color(red: 0.211, green: 0.138, blue: 0.095)))
                                .frame(width: 400, height: 150)
                            
                            VStack {
                                Text("Leave a review!!")
                                    .foregroundColor(.white)
                                TextField("", text: $reviews, axis: .vertical)
                                    .background(Color.white)
                                    .frame(width: 330)
                                    .padding()
                            }
                        }
                    }
                }
//                .navigationBarTitle("On The Block", displayMode: .inline)
//                    .accessibilityAddTraits(.isHeader)
//                    .toolbar {
//                        ToolbarItem(placement: .principal) {
//                            Text("Dime Store")
//                                .font(.largeTitle)
//                                .accessibilityAddTraits(.isHeader)
//                        }
//                    }
            }
        }
    }
}
struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView(store: .example)
    }
}
