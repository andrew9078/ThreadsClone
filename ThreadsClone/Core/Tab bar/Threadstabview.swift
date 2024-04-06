//
//  Threadstabview.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 3/27/24.
//

import SwiftUI

struct Threadstabview: View {
    @State private var selectedtab = 0
    @State private var showthreadview = false
    var body: some View {
        TabView(selection: $selectedtab){
            Feedview()
                .tabItem {
                    Image(systemName: selectedtab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedtab == 0 ? .fill: .none)
                }//tab item
            
                .onAppear{selectedtab = 0}
                .tag(0)
            Exploreview()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }//Explore tab item
            
                .onAppear{selectedtab = 1}
                .tag(1)
            
            Text("")
                .tabItem{
                    Image(systemName: "plus")
                }//Explore tab item
            
                .onAppear{selectedtab = 2}
                .tag(2)
            
           Activityview()
                .tabItem{
                    Image(systemName: selectedtab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedtab == 3 ? .fill: .none)
                }//Explore tab item
            
                .onAppear{selectedtab = 3}
                .tag(3)
            
            CurrentProfileView()
                .tabItem{
                    Image(systemName: selectedtab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedtab == 4 ? .fill: .none)
                }//Explore tab item
            
                .onAppear{selectedtab = 4}
                .tag(4)
        }//View
        .onChange(of: selectedtab, perform: { newValue in
            showthreadview = selectedtab == 2
        })//onChange
        
        .sheet(isPresented: $showthreadview, onDismiss: { selectedtab = 0
        }, content : {
            CreateThreadview()
        })
        .tint(.black)
    }//tabview
}//Struct view

#Preview {
    Threadstabview()
}
