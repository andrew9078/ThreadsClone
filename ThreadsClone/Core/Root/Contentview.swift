//
//  Contentview.swift
//  ThreadsClone
//
//  Created by Andrew Jung on 4/4/24.
//

import SwiftUI

struct Contentview: View {
    @StateObject var viewModel = Contentviewmodel()
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                Threadstabview()
            }//if
            else{
                Loginview()
            }
        }
    }//Var body
}//Struct

#Preview {
    Contentview()
}
