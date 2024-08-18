//
//  RegisterView.swift
//  CRM_macos
//
//  Created by Abhay singh on 18/08/24.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        RegisterFormView()
    }
}

struct RegisterFormView : View {
    @ObservedObject var view = UserCredentialForm.shared
    var body: some View {
        NavigationStack {
            VStack{
                Text("Register")
                    .font(.system(size: 17, weight: .bold))
                Form{
                    TextField("Email", text: $view.email)
                        .frame(width: (NSScreen.main?.frame.width ?? 0)/3 ,height: 40)
                    TextField("Password", text: $view.password)
                        .frame(width: (NSScreen.main?.frame.width ?? 0)/3 ,height: 40)
                    HStack{
                        Button(action: {
                            view.addUser()
                            print("Registered")
                        }, label: {
                            Text("Register")
                        })
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text("login")
                        }

                    }
                }
                .frame(width: (NSScreen.main?.frame.width ?? 0) / 2,
                       height: (NSScreen.main?.frame.height ?? 0) / 2)
                .background(BlurView())
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                
            }
        }
        
    }
}

#Preview {
    RegisterView()
        .frame(width: NSScreen.main?.frame.width,
               height: NSScreen.main?.frame.height)
}
