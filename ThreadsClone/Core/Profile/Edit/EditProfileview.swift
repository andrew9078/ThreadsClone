//
//  Profileview.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/2/24.
//

import SwiftUI
import PhotosUI

struct EditProfileview: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isprivateprofile = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: Profileviewmodel
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                           Text("Name")
                                .fontWeight(.semibold)
                            Text("Lionel Messi")
        
                        }//Inner Vstack
                        .font(.footnote)
                        
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem){
                            if let Image = viewModel.profileImage{
                                Image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                            }//if
                            
                            else{
                                CircularProfileImageView()
                            }
                        }//PhotosPicker
                        
                    }//HStack
                    
                    Divider()
                    
                    //Bio Field
                    
                    VStack(alignment:.leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio...", text: $bio, axis: .vertical)
                    }
                    
                    .font(.footnote)
                    Divider()
                    
                    
                    VStack(alignment:.leading){
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your link...", text: $link)
                    }//VSTACK
                    
                    .font(.footnote)
                    Divider()
                    
                    Toggle("Private Profile", isOn: $isprivateprofile)
                    
                    
                }//VStack
                
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(8)
                .overlay{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray3), lineWidth: 1)
                        
                }//overlay
                .padding()
                
            }//ZStack
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            
            
            
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }//Button
                    .font(.subheadline)
                    .foregroundColor(.black)
                }//ToolbarItem
                
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Done"){
                        
                    }//Button
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }//ToolbarItem
                
                
                
            
            }//toolbar
            
        }//NavigationStack
    }
}

#Preview {
    EditProfileview()
}
