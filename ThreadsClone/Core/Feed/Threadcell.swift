//
//  Threadcell.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 3/27/24.
//

import SwiftUI

struct Threadcell: View {
    var body: some View {
        VStack{
            HStack (alignment: .top, spacing: 12){
               CircularProfileImageView()
                
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        Text("Kelly Slater")
                            .font(.footnote)
                        .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        Button{
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }//label
                    }//Hstack
                    
                    Text("WSL Champion")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                     
                    HStack (spacing: 16){
                        Button {
                            
                        }  label: {
                            Image(systemName: ("heart"))
                        }
                        
                        Button {
                            
                        }  label: {
                            Image(systemName: ("bubble.right"))
                        }
                        
                        Button {
                            
                        }  label: {
                            Image(systemName: ("arrow.rectanglepath"))
                        }
                        
                        Button {
                            
                        }  label: {
                            Image(systemName: ("paperplane"))
                        }
                        
                    }//Hstack
                    .padding(.vertical, 8)
                    .foregroundColor(.black)
                }
            }//HStack
            Divider()
        }//vstack
        .padding()
        
        
    }
}

#Preview {
    Threadcell()
}
