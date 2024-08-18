//
//  LeadDetailView.swift
//  CRM_macos
//
//  Created by Abhay singh on 18/08/24.
//

import SwiftUI

struct LeadDetailView: View {
    var body: some View {
        LeadFormView()
    }
}


struct LeadFormView: View {
    @ObservedObject var view = LeadView()  //Observing LeadView for changes so it can append new values
    var body: some View {
        NavigationStack{
            Form{
                VStack{
                    Text("Add Lead")
                        .font(.system(size: 14, weight: .bold))
                    TextField("Name", text: $view.name)
                        .frame(height:40)
                    TextField("lead Source", text: $view.leadSource)
                        .frame(height:40)
                    TextField("Compnay", text: $view.company)
                        .frame(height:40)
                    HStack{
                        TextField("Phone Number", text: $view.phoneNumber)
                            .frame(height:50)
                        TextField("Email", text: $view.email)
                            .frame(height:50)
                    }
                }
                .padding()
            }
            .frame(width: 600,height: .infinity)
            
            Button(action: {
                view.addLead()
            }, label: {
                Text("Add")
            })
            .padding(.bottom)
        }
    }
}

//MARK: output LeadList
struct showLeadList : View {
    @ObservedObject var view = LeadView()
    var body: some View {
        ZStack{
            ForEach(view.leadsList){lead in
                VStack{
                    Text("\(view.name)")
                        .foregroundStyle(Color.white)
                }
            }
        }
    }
}


#Preview {
    LeadFormView()
        .frame(width: NSScreen.main?.frame.width,
               height: NSScreen.main?.frame.height)
}
