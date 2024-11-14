//
//  ContentView.swift
//  App1059
//
//  Created by IGOR on 13/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            if status {
        
                HomeView()
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
