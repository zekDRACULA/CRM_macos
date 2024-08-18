//
//  LogInView.swift
//  CRM_macos
//
//  Created by Abhay singh on 18/08/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        LoginFormView()
    }
}

//MARK: stuct for email and password
struct User : Identifiable{
    var id = UUID()
    var email : String
    var password : String
}

class UserCredentialForm : ObservableObject{
    static let shared = UserCredentialForm()
    
    @Published var isAuthenticated : Bool = false
    @Published var email : String = ""
    @Published var password : String = ""
    
    @Published var userList : [User] = []
    
    private init(){}
    
    func addUser(){
        let newUser = User(email: email, password: password)
        userList.append(newUser)
        email = ""
        password = ""
    }
    
    func matchCredentiails(){
        
        for user in userList{
            if user.email == email && user.password == password{
                isAuthenticated = true
            }else{
                isAuthenticated = false
            }
        }
    }
    
}

struct LoginFormView : View {
    @ObservedObject var view = UserCredentialForm.shared
    var body: some View {
        NavigationStack {
            VStack{
                Text("Login")
                    .font(.system(size: 17, weight: .bold))
                Form{
                    TextField("Email", text: $view.email)
                        .frame(width: (NSScreen.main?.frame.width ?? 0)/3 ,height: 40)
                    TextField("Password", text: $view.password)
                        .frame(width: (NSScreen.main?.frame.width ?? 0)/3 ,height: 40)
                    HStack{
                        Button(action: {
                            view.matchCredentiails()
                        }, label: {
                            Text("Login")
                        })
                        NavigationLink {
                            RegisterView()
                        } label: {
                            Text("Register")
                        }

                    }
                }
                .frame(width: (NSScreen.main?.frame.width ?? 0) / 2,
                       height: (NSScreen.main?.frame.height ?? 0) / 2)
                .background(BlurView())
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                
               // NavigationLink("", destination : Dashboard(), isActive: $view.isAuthenticated)
                .navigationDestination(isPresented: $view.isAuthenticated) {
                    Dashboard()
                }
                
            }
        }
        
    }
}

#Preview {
    LoginView()
        .frame(width: NSScreen.main?.frame.width,
               height: NSScreen.main?.frame.height)
}
