//
//  Usercontentview.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/5/24.
//

import SwiftUI

struct Usercontentview: View {
    var body: some View {
        
        @State var selectedFilter: Profilethreadfilter = .threads
        @Namespace var animation
        
        var filterBadWidth: CGFloat {
            let count = CGFloat(Profilethreadfilter.allCases.count)
            return UIScreen.main.bounds.width / count - 16
            
        }//private var
        
        VStack{
            HStack{
                ForEach(Profilethreadfilter.allCases){
                    filter in
                    VStack{
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold: .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 180, height: 1)
                                .matchedGeometryEffect(id: "Item", in: animation)
                            
                        }//if
                        else{
                            Rectangle()
                                .foregroundColor(.clear)
                            .frame(width: 180, height: 1)}
                        
                        
                    }//Vstack
                    
                    .onTapGesture {
                        withAnimation(.spring()){
                            selectedFilter = filter
                        }//with animation
                    }//onTapGesture
                }//Foreach
            }//HStack
            
            LazyVStack{
                ForEach(0...10, id: \.self){thread in
                    
                }//ForEach
            }//LazyVStack
        }//Vstack    }
    }
}
#Preview {
    Usercontentview()
}
