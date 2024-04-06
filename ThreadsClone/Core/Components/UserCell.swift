//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/2/24.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        HStack{
            CircularProfileImageView()
            VStack(alignment: .leading, spacing: 4){
                Text(user.username)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
                
            }//Vstack
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay{
                    (RoundedRectangle(cornerRadius: 10))
                        .stroke(Color(.systemGray3), lineWidth: 1)
                }//overlay
        }//Hstack
        .padding(.horizontal)    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View{
        UserCell(user: dev.user)
    }
}
