//
//  SwiftUIView.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/5/24.
//

import SwiftUI

struct Profileheaderview: View {
    var user: User?
    
    init(user: User?){
        self.user = user
    }
    
    var body: some View {
        HStack (alignment: .top){
            VStack(alignment: .leading, spacing: 12){
                //Fullname and Username
                VStack(alignment: .leading, spacing: 4){
                    Text(user.fullname)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user.username)
                        .font(.subheadline)
                }//Vstack .leading
                
                if let bio = user.bio{
                    Text(bio)
                        .font(.footnote)
                }//if let
                
                Text("2 Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }//OuterVstack
            
            Spacer()
            
            CircularProfileImageView()
        }
    }
}

#Preview {
    SwiftUIView()
}
