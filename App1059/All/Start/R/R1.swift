//
//  R1.swift
//  App1059
//
//  Created by IGOR on 13/11/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.bottom, 50)
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 9) {
                    
                    Text("Intuitive interface")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Our interface is intuitive. You can quickly add dishes, products and plan menus")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    
                }
                .padding()
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity)
                .frame(height: 340)
                .background(RoundedRectangle(cornerRadius: 0).fill(Color("bg3")))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    R1()
}