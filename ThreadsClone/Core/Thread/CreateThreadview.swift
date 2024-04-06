//
//  Threadview.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 3/27/24.
//

import SwiftUI

struct CreateThreadview: View {
    @State private var caption = ""
    @Environment (\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    CircularProfileImageView()
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("Kelly")
                            .fontWeight(.semibold)
                        TextField("Start a thread . . ." , text: $caption, axis: .vertical)
                    }//VStack
                    
                    .font(.footnote)
                    
                    Spacer()
                    
                    if(!caption.isEmpty){Button{
                        caption = ""
                        
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
                        
                    }//Button
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
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
