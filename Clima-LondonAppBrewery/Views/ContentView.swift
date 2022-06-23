//
//  ContentView.swift
//  Clima-LondonAppBrewery
//
//  Created by Paul Kirnoz on 22.06.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CityViewViewModel()
    var body: some View {
        ZStack {
            ImageBackgroundView()
                .ignoresSafeArea(.all)
                
                
            VStack {
                SearchBar(cityVM: cityVM)
                MainInfoView(cityVM: cityVM)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
