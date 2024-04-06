//
//  Registrationview.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 3/26/24.
//

import SwiftUI

struct Registrationview: View {
    @StateObject var viewmodel = Registrationmodel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Spacer()
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            VStack{
                TextField("Enter your email", text: $viewmodel.email)
                    .modifier(Threadstextfieldmodifier())

                
                SecureField("Enter your password", text: $viewmodel.password)
                    .modifier(Threadstextfieldmodifier())

                
                TextField("Enter your full name", text: $viewmodel.fullname)
                    .modifier(Threadstextfieldmodifier())

                TextField("Enter your username", text: $viewmodel.username    )
                    .modifier(Threadstextfieldmodifier())

            }//Inner Vstack
            .autocapitalization(.none)
            
            Button{
                Task { try await viewmodel.createUser()}
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 42)
                    .background(.black)
                    .cornerRadius(10)
            }//label
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            
            Button{
                dismiss()
            }label: {
                HStack (spacing: 3){
                    Text("Already have an Account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}
#Preview {
    Registrationview()
}
