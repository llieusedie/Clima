//
//  MenuHeaderView.swift
//  Clima
//
//  Created by Paul Kirnoz on 20.06.2022.
//

import SwiftUI

struct SearchBar: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    @State private var searchTerm = "San Francisco"
    
    
    @FocusState private var searchIsFocused: Bool
    
    var body: some View {
        HStack {
            TextField("", text: $searchTerm)
                .padding(7)
                .padding(.horizontal, 25)
                .background(.white).opacity(0.5)
                .cornerRadius(8)
                .font(.headline)
                .focused($searchIsFocused)
                .submitLabel(.search)
                .keyboardType(.alphabet)
            
            Button {
                withAnimation(.spring()) {
                    cityVM.city = searchTerm
                    searchIsFocused = false
                }
                
            } label: {
                Image(systemName: "location.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
            }
        }
        .padding()
        
    }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
