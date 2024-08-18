//
//  Apointment.swift
//  CRM_macos
//
//  Created by Abhay singh on 18/08/24.
//

import SwiftUI

//MARK: Appointment Struct
struct Apointment: View {
    var body: some View {
        AppointmentForm()
    }
}

//MARK: Appointments Struct
struct Appointments{
    var name : String
    var company : String
    var message : String
}

class AppointmentsView : ObservableObject{
    @Published var name : String = ""
    @Published var company : String = ""
    @Published var message : String = ""
    
    @Published var appointmnetList : [Appointments] = []
    func addAppointment(){
        let newAppointment = Appointments( name : name,
                                           company: company,
                                           message: message)
        appointmnetList.append(newAppointment)
        name = ""
        company = ""
        message = ""
    }
    
    func getAppointMent(){
        print(appointmnetList.count)
    }
}

//MARK: Appointment fORM
struct AppointmentForm : View {
    @ObservedObject var view = AppointmentsView()
    var body: some View {
        NavigationStack{
            Form{
                VStack{
                    Text("Add Appointment")
                        .font(.system(size: 14, weight: .bold))
                    TextField("Name", text: $view.name)
                        .frame(height:40)
                    TextField("lead Source", text: $view.company)
                        .frame(height:40)
                    TextField("Compnay", text: $view.message)
                        .frame(height:40)
                }
                .padding()
            }
            .frame(width: 600,height: .infinity)
            
                Button(action: {
                    view.addAppointment()
                }, label: {
                    Text("Add")
                })
                .padding(.leading)
            
            .padding(.bottom)
        }
    }
}



//MARK:  LeadView Class
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
        name = ""
        leadSource = ""
        company = ""
        phoneNumber = ""
        email = ""
        
    }
}

#Preview {
    Apointment()
        .frame(width: NSScreen.main?.frame.width,
               height: NSScreen.main?.frame.height)
}
