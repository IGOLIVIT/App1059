//
//  ScheduleView.swift
//  App1059
//
//  Created by IGOR on 13/11/2024.
//

import SwiftUI

struct ScheduleView: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedPerson?.pFLName ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                router.wrappedValue.dismiss()
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddSchedule = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .regular))
                        })
                    }
                }
                .padding(.bottom, 22)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(viewModel.days, id: \.self) { indexer in
                    
                        LazyVStack {
                            
                            HStack {
                                
                                Text(indexer)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold))
                                    
                                Spacer()
                            }
                            
                            Rectangle()
                                .fill(.white.opacity(0.1))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Daily ration")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 13, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(viewModel.schedules.filter{($0.scDay ?? "") == indexer}.filter{($0.scPerson ?? "") == (viewModel.selectedPerson?.pFLName ?? "")}, id: \.self) { index in
                            
                                VStack {
                                    
                                    HStack {
                                        
                                        Text(index.scR1TM ?? "")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text(index.scR1Dish ?? "")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                    
                                    HStack {
                                        
                                        Text("Recuired calories")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text(index.scR1RC ?? "")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 16).fill(.white.opacity(0.1)))
                                
                                VStack(spacing: 8) {
                                    
                                    HStack {
                                        
                                        Text(index.scR2TM ?? "")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text(index.scR2Dish ?? "")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                    
                                    HStack {
                                        
                                        Text("Recuired calories")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text(index.scR2RC ?? "")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 16).fill(.white.opacity(0.1)))
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchScheds()
        }
        .sheet(isPresented: $viewModel.isAddSchedule, content: {
            
            AddSchedule(viewModel: viewModel)
        })
    }
}

#Preview {
    ScheduleView(viewModel: HomeViewModel())
}
