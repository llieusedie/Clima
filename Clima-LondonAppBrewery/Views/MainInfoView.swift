//
//  MainInfoView.swift
//  Clima-LondonAppBrewery
//
//  Created by Paul Kirnoz on 22.06.2022.
//

import SwiftUI

struct MainInfoView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    
                        LottieView(name: cityVM.getLottieAnimationFor(icon: cityVM.weatherIcon))
                            .frame(width: 200, height: 200)
                        
                        Text("\(cityVM.temperature)°C")
                            .font(.system(size: 50)).bold()
                        
                        Text(cityVM.city)
                            .font(.system(size: 40)).bold()
                        Text("\(cityVM.conditions)")
                            .font(.system(size: 30)).bold()
                    
                }
                .shadow(radius: 10)
                .foregroundColor(.white)
                .padding([.bottom, .trailing])
                
            }
            Spacer()
        }
    }
}

struct MainInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
