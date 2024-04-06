//
//  Feedview.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 3/27/24.
//

import SwiftUI

struct Feedview: View {
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                LazyVStack{
                    ForEach(0 ... 10, id: \.self){thread in
                        Threadcell()
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
