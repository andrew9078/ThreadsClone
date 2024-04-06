//
//  View.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 3/27/24.
//

import SwiftUI

struct Exploreview: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = Exploreviewmodel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.users){user in
                        NavigationLink(value: user){
                            VStack{
                                UserCell(user: user)
                                
                                Divider()
                            }//VStack
                            
                            .padding(.vertical, 4)
                        }//NavigationLInk
                    }
                }//LazyVstack
            }//ScrollView
            .navigationDestination(for: User.self, destination: {
                user in Profileview(user: user)
            })
            .navigationTitle("Search")
            .searchable(text:$searchText, prompt: "Search")
        }//NavigationStack
    }
}

struct ExploreView_Previews: PreviewProvider{
    static var previews: some View{
        Exploreview()
    }//static var
    
}
