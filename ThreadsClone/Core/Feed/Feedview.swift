//
//  Feedview.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 3/27/24.
//

import SwiftUI
@MainActor
struct Feedview: View {
    @StateObject var viewModel = Feedviewmodel()
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                LazyVStack{
                    ForEach(viewModel.threads){thread in
                        Threadcell(thread: thread)
                    }
                }
            }//LazyVStack
            .refreshable{
                print("Debug refresh threads")
            }
            
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }//Navigation Stack
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    
                }label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
                }
            }//Toolbaritem
        }//toolbar
    }//var body view
}//struct view

#Preview {
    NavigationStack{
        Feedview()
    }
}
