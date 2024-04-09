//
//  CurrentProfileView.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/5/24.
//

import SwiftUI
struct CurrentProfileView: View {
    @StateObject var viewModel = Profileviewmodel()
    @State private var showEditProfile = false
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
                    
                    Profileheaderview(user: currentUser)
                    Button{
                        showEditProfile.toggle()
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }//overlay
                    }//Button//label
                    
                    //User Content
                    Usercontentview()
                        .padding(.vertical, 8)
                    
                    
                    
                }//Scrollvew
                
                .sheet(isPresented: $showEditProfile, content: {
                    EditProfileview()
                        .environmentObject(viewModel)
                })//sheet
                
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
            
            .padding(.vertical, 8)
        }
    }
    
    //Preview {
    //CurrentProfileView()
    //}
}

#Preview {
        CurrentProfileView()
}
