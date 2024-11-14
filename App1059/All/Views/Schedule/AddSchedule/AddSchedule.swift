//
//  AddSchedule.swift
//  App1059
//
//  Created by IGOR on 13/11/2024.
//

import SwiftUI

struct AddSchedule: View {

    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var route
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 18) {
                
                ZStack {
                    
                    Text("Add a ration")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                        
                            viewModel.scR1TM = ""
                            viewModel.scR2TM = ""
                            viewModel.scR1Dish = ""
                            viewModel.scR2Dish = ""
                            viewModel.scR1RC = ""
                            viewModel.scR2RC = ""
                            viewModel.curDay = ""
                            
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
                            
                            Text("Day of the week")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                                .padding(.trailing)
                            
                            Menu(content: {
                                
                                ForEach(viewModel.days, id: \.self) { index in
                                    
                                    Button(action: {
                                       
                                        viewModel.curDay = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                Text(viewModel.curDay)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)

                            })
    
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Text("Ration 1")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        HStack {
                            
                            Text("Type of meal")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("Breakfast")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.scR1TM.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.scR1TM)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            })
    
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        HStack {
                            
                            Text("Dish")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("Omelette")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.scR1Dish.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.scR1Dish)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            })
    
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        HStack {
                            
                            Text("Required calories")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("100 kkal")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.scR1RC.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.scR1RC)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            })
    
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Text("Ration 2")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        HStack {
                            
                            Text("Type of meal")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("Breakfast")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.scR2TM.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.scR2TM)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            })
    
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        HStack {
                            
                            Text("Dish")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("Omelette")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.scR2Dish.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.scR2Dish)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            })
    
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        
                        HStack {
                            
                            Text("Required calories")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("100 kkal")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.scR2RC.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.scR2RC)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                            })
    
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        .padding(.bottom)
                        .padding(.bottom, 30)
                        
                        Button(action: {
                            
                            viewModel.scPerson = viewModel.selectedPerson?.pFLName ?? ""
                            viewModel.scDay = viewModel.curDay
                            
                            viewModel.addSched()
                            
                            viewModel.scR1TM = ""
                            viewModel.scR2TM = ""
                            viewModel.scR1Dish = ""
                            viewModel.scR2Dish = ""
                            viewModel.scR1RC = ""
                            viewModel.scR2RC = ""
                            viewModel.curDay = ""
                            
                            viewModel.fetchScheds()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddSchedule = false
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        .opacity(viewModel.scR1TM.isEmpty || viewModel.scR1Dish.isEmpty || viewModel.scR1RC.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.scR1TM.isEmpty || viewModel.scR1Dish.isEmpty || viewModel.scR1RC.isEmpty ? true : false)
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
    AddSchedule(viewModel: HomeViewModel())
}
