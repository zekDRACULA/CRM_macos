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

class LeadView: ObservableObject {
    @Published var name : String = ""
    @Published var leadSource : String = ""
    @Published var company : String = ""
    @Published var phoneNumber : String = ""
    @Published var email : String = ""
    
    @Published var leadsList: [Lead] = []
    
    func addLead(){
        
        let newLead = Lead(name: name,
                           leadSource: leadSource,
                           company: company,
                           phoneNumber: phoneNumber,
                           email: email)
        leadsList.append(newLead)
    }
}



struct LeadFormView: View {
    @ObservedObject var view = LeadView()  //Observing LeadView for changes so it can append new values
    var body: some View {
        NavigationStack{
            Form{
                VStack{
                    TextField("Name", text: $view.name)
                    TextField("lead Source", text: $view.leadSource)
                    TextField("Compnay", text: $view.company)
                    HStack{
                        TextField("Phone Number", text: $view.phoneNumber)
                        TextField("Email", text: $view.email)
                    }
                }
            }
            Button(action: {
                view.addLead()
            }, label: {
                Text("Add")
            })
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
    showLeadList()
}
