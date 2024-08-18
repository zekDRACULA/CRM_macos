//
//  LeadDetailView.swift
//  CRM_macos
//
//  Created by Abhay singh on 18/08/24.
//

import SwiftUI

struct LeadDetailView: View {
    @ObservedObject var view = LeadView.shared
    var body: some View {
        List(view.leadsList) { lead in
            VStack(alignment: .leading) {
                HStack {
                    Text("Name:")
                        .font(.headline)
                        
                    Text(lead.name)
                        .font(.body)
                        
                }
                
                HStack {
                    Text("Company:")
                        .font(.headline)
                        
                    Text(lead.company)
                        .font(.body)
                        
                }
                
                HStack {
                    Text("Lead Source:")
                        .font(.headline)
                        
                    Text(lead.leadSource)
                        .font(.body)
                        
                }
                
                
                
                HStack {
                    HStack {
                        Text("Email:")
                            .font(.headline)
                            
                        Text(lead.email)
                            .font(.body)
                            
                    }
                    .padding(.trailing)
                    Text("Phone Number:")
                        .font(.headline)
                        
                    Text(lead.phoneNumber)
                        .font(.body)
                        
                }
            }
            .padding()
            .background(Color.clear)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .listStyle(PlainListStyle()) // Optional: Adjust list style
    }
}

// MARK: LeadView Class
class LeadView: ObservableObject {
    static let shared = LeadView()
    
    @Published var name: String = ""
    @Published var leadSource: String = ""
    @Published var company: String = ""
    @Published var phoneNumber: String = ""
    @Published var email: String = ""
    
    @Published var leadsList: [Lead] = []
    
    private init(){}
    
    func addLead() {
        let newLead = Lead(name: name,
                           leadSource: leadSource,
                           company: company,
                           phoneNumber: phoneNumber,
                           email: email)
        leadsList.append(newLead)
        name = ""
        leadSource = ""
        company = ""
        phoneNumber = ""
        email = ""
    }
}


struct LeadFormView: View {
    @ObservedObject var view = LeadView.shared //Observing LeadView for changes so it can append new values
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




#Preview {
    LeadFormView()
        .frame(width: NSScreen.main?.frame.width,
               height: NSScreen.main?.frame.height)
}
