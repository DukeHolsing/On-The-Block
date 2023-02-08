//
//  EditBusinessView.swift
//  nopalesapp
//
//  Created by Abe Molina on 2/7/23.
//

import MapKit
import SwiftUI

struct EditBusinessView: View {
    
    var eggShell = #colorLiteral(red: 0.9302913547, green: 0.9253246188, blue: 0.916793704, alpha: 1)
    @State private var region =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.3309, longitude: -83.0479), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        
        ZStack {
            
            Color(eggShell)
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    
                    Text("Insert name")
                        .font(.system(size: 40))
                        .padding()
                    
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.gray)
                        .frame(width: 420, height: 800)
                    
                    
                    HStack {
                        
                     RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.gray)
                            .frame(width: 210, height: 300)
                            .position(x: 95, y: 153)
                            .padding()
                        
                        Text("Dime store is a store that sells store things for stores that support stores inside of stores, these stores pride themsevles designing their stores with dimes as it represents them as a dime store that supports stores that support outside stores outside of stores inside of bigger stores to store things in storage.")
                            .padding()
                    }
                    
                    Map(coordinateRegion: $region)
                        .frame(width: 420, height: 180)
                        .border(.black)
                        .cornerRadius(8)
                }
            }
        }
    }
}

struct EditBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        EditBusinessView()
    }
}