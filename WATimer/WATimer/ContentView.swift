//
//  ContentView.swift
//  WATimer
//
//  Created by Cédric Bahirwe on 28/01/2021.
//

import SwiftUI

struct ContentView: View {
        @Environment(\.scenePhase) var scenePhase
    var body: some View {
        //        Home()
        TaskView()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
