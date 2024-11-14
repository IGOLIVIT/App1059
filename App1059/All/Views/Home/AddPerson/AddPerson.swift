//
//  AddPerson.swift
//  App1059
//
//  Created by IGOR on 13/11/2024.
//

import SwiftUI

struct AddPerson: View {

    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var route
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 18) {
                
                ZStack {
                    
                    Text("Add a person")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.pFLName = ""
                            viewModel.pStatus = ""
                            viewModel.pTCPD = ""
                            viewModel.pTCPW = ""
                            viewModel.curAv = ""
                        
                            route.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        HStack {
                            
                            Text("First and last name")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("Jane Cooper")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.pFLName.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.pFLName)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            })
    
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        HStack {
                            
                            Text("Status")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("Mother")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.pStatus.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.pStatus)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            })
    
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        HStack {
                            
                            Text("Total calories per day")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("2,000 kkal")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.pTCPD.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.pTCPD)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            })
    
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        HStack {
                            
                            Text("Total calories per week")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("13,000 kkal")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.pTCPW.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.pTCPW)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            })
    
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Text("Avatar")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ForEach(viewModel.avatars, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curAv = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .opacity(viewModel.curAv == index ? 1 : 0.5)
                                })
                            }
                        }
                        .padding(.bottom, 30)
                        
                        Button(action: {
                            
                            viewModel.pAv = viewModel.curAv
                            
                            viewModel.addPers()
                            
                            viewModel.pFLName = ""
                            viewModel.pStatus = ""
                            viewModel.pTCPD = ""
                            viewModel.pTCPW = ""
                            viewModel.curAv = ""
                            
                            viewModel.fetchPers()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        .padding(.bottom, 20)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    AddPerson(viewModel: HomeViewModel())
}
