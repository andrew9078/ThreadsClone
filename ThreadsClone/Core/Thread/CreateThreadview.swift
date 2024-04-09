//
//  Threadview.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 3/27/24.
//

import SwiftUI

struct CreateThreadview: View {
    @StateObject var viewModel = CreateThreadViewModel()
    
    @Environment (\.dismiss) var dismiss
    
    private var user: User? {
        return Userservice.shared.currentUser
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    CircularProfileImageView()
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        TextField("Start a thread . . ." , text: $viewModel.caption, axis: .vertical)
                    }//VStack
                    
                    .font(.footnote)
                    
                    Spacer()
                    
                    if(!viewModel.caption.isEmpty){Button{
                    
                        viewModel.caption = ""
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.gray)
                        }//Button
                    }//if
                }//HStack
                
                .padding()
                
            }//Vstack
            
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }//Button
                    .font(.subheadline)
                    .foregroundColor(.black)
                    
                }//ToolbarItem1
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Post"){
                        Task {try await viewModel.uploadThread()}
                        dismiss()
                    }//Button
                    .opacity(viewModel.caption.isEmpty ? 0.5 : 1.0)
                    .disabled(viewModel.caption.isEmpty)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .foregroundColor(.black)
                }//Toolbar2
            }//toolbar
            
            
        }//NavigationStack
    }//var body
}//struct threadivew
#Preview {
    CreateThreadview()
}
