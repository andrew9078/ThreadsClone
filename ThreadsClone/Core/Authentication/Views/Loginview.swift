//
//  Loginview.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 3/24/24.
//

import SwiftUI

struct Loginview: View {
    @StateObject var viewModel = loginviewmodel()
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("threads-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                VStack{
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(Threadstextfieldmodifier())
                        .autocapitalization(.none)
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(Threadstextfieldmodifier())

                    
                }//Inner Vstack
                
                NavigationLink {
                    Text("Forgot Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                }//label
               
                Button{
                    Task{try await viewModel.login()}
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 42)
                        .background(.black)
                        .cornerRadius(10)
                }//label
                
                Spacer()
                Divider()
                
                NavigationLink{
                    Registrationview()
                        .navigationBarBackButtonHidden(true)
                    
                } label: {
                    HStack (spacing: 3){
                        Text("Don't have an accont")
                        Text("Sign up!")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }//label
                
                
            }//Vstack
            
        }//NavigationStack
    }
}

#Preview {
    Loginview()
}
