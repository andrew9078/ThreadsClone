//
//  Profileview.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 3/27/24.
//

import SwiftUI

struct Profileview: View {
    let user: User
    
   
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            VStack (spacing: 20){
                Profileheaderview(user: user)
                    
        
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
               
                Usercontentview()
                
                
            }//Vstack
            
        }//Scrollvew
        
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        
    }//Some view
}//Struct Profile View

struct Profileview_preview: PreviewProvider{
    static var previews: some View{
        Profileview(user: dev.user)
    }
}
