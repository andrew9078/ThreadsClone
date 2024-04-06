//
//  CurrentProfileView.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/5/24.
//

import SwiftUI
struct CurrentProfileView: View {
    @StateObject var viewModel = Profileviewmodel()
    @State private var selectedFilter: Profilethreadfilter = .threads
    @Namespace var animation

    private var filterBadWidth: CGFloat {
        let count = CGFloat(Profilethreadfilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
        
    }//private var
    
    private var currentUser: User? {
        return viewModel.currentUser
    }//private var
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack (spacing: 20){
                    if let user = currentUser{
                        Profileheaderview(user: user)
                    }
                    Button{
                        
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    }//Button//label
                    
    //User Content
                    
                    VStack{
                        HStack{
                            ForEach(Profilethreadfilter.allCases){
                                filter in
                                VStack{
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold: .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: 180, height: 1)
                                            .matchedGeometryEffect(id: "Item", in: animation)
                                        
                                    }//if
                                    else{
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 180, height: 1)}
                                    
                                    
                                }//Vstack
                                
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        selectedFilter = filter
                                    }//with animation
                                }//onTapGesture
                            }//Foreach
                        }//HStack
                        
                        LazyVStack{
                            ForEach(0...10, id: \.self){thread in
                                Threadcell()
                                
                            }//ForEach
                        }//LazyVStack
                    }//Vstack
                    .padding(.vertical, 8)
                    
                }//Vstack
                    
            }//Scrollvew
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        AuthService.shared.signOut()
                    }label: {
                        Image(systemName: "line.3.horizontal")
                    }//button/label
                }//toolbaritem
            }//toolbar
            .padding(.horizontal)
        }//NavigationStack
    }
}

#Preview {
    CurrentProfileView()
}
