//
//  HomeView.swift
//  App1059
//
//  Created by IGOR on 13/11/2024.
//

import SwiftUI
import StoreKit

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Home")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add a person")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        })
                    }
                }
                .padding(.bottom, 22)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if viewModel.persons.isEmpty {
                        
                        VStack(spacing: 12) {
                            
                            Text("Empty page")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .semibold))
                            
                            Text("You have no persons created")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .padding(.bottom)
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text("Add person")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                  
                                    Image(systemName: "plus")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 17, weight: .regular))
                                        .padding(4)
                                        .background(RoundedRectangle(cornerRadius: 6).fill(.white))
                                }
                                .padding(6)
                                .padding(.horizontal, 5)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 250)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                    } else {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.persons, id: \.self) { index in
                            
                                VStack(spacing: 12) {
                                    
                                    HStack {
                                        
                                        Image(index.pAv ?? "")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            Text(index.pFLName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .semibold))
                                            
                                            Text(index.pStatus ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 15, weight: .regular))
                                            
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    Rectangle()
                                        .fill(.white.opacity(0.05))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                    
                                    HStack {
                                        
                                        Text("Total calories per day")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text(index.pTCPD ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                    }
                                    
                                    HStack {
                                        
                                        Text("Total calories per week")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text(index.pTCPW ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                    }
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedPerson = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isSchedule = true
                                        }
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Text("Go to the meal schedule")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15, weight: .regular))
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .regular))
                                                .padding(7)
                                                .background(Circle().fill(.white.opacity(0.3)))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                    })
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                            }
                        }
                    }
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 8)
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/8178fac7-0361-4023-a555-4c84b44a7322") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "doc.text.magnifyingglass")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 30, weight: .semibold))
                                .padding(.trailing, 7)
                            
                            VStack(alignment: .leading) {
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .semibold))
                                
                                Text("Go to \(Image(systemName: "arrow.up.right"))")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 30, weight: .semibold))
                                .padding(.trailing, 7)
                            
                            VStack(alignment: .leading) {
                                
                                Text("Rate our app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .semibold))
                                
                                Text("Go to \(Image(systemName: "arrow.up.right"))")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                        .padding(1)
                    })
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPers()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddPerson(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isSchedule, content: {
            
            ScheduleView(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
