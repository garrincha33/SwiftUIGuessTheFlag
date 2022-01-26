//
//  ContentView.swift
//  SwiftUIGuessTheFlag
//
//  Created by Richard Price on 26/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("testing grids")
                Text("testing grids")
                Text("testing grids")
            }.padding()
            
            HStack {
                Text("testing grids")
                Text("testing grids")
                Text("testing grids")
            }.padding()
            
            HStack {
                Text("testing grids")
                Text("testing grids")
                Text("testing grids")
            }.padding()
                
        }.padding()
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
