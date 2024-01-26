//
//  ContentView.swift
//  cokluservis
//
//  Created by Olgun ‏‏‎‏‏‎ on 26.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var UserListViewModel : UserListViewModel
    
    init() {
        self.UserListViewModel = cokluservis.UserListViewModel(service: WebService())
    }
    
    
    var body: some View {
        List(UserListViewModel.userList,id: \.id) { user in
            VStack {
                Text(user.name)
                Text(user.email)
            }
            
        }.task {
            await UserListViewModel.downloadUsers()
        }
        
        
    }
}

#Preview {
    ContentView()
}
