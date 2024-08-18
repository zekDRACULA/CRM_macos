//
//  Apointment.swift
//  CRM_macos
//
//  Created by Abhay singh on 18/08/24.
//

import SwiftUI

struct Apointment: View {
    @ObservedObject var view = AppointmentsView.shared
    var body: some View {
        
        if view.appointmentList.isEmpty {
            Text("No Appointments")
        } else {
            List(view.appointmentList) { appointment in
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Name:")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(appointment.name)
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Text("Company:")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(appointment.company)
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Message:")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Text(appointment.message)
                            .font(.body)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: (NSScreen.main?.frame.width ?? 0) - 140, alignment: .leading)
                            .background(Color.white.opacity(0.2))                             .cornerRadius(10)
                        Spacer()
                    }
                    .padding(.bottom, 10)
                }
                .padding()
                .frame(width: (NSScreen.main?.frame.width ?? 0) - 120, alignment: .leading)
                .background(
                    ZStack {
                        // Glassmorphism effect
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white.opacity(0.1))  // Semi-transparent background
                            .background(BlurView())  // Blur effect
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    }
                )
                .padding(.vertical, 5)
            }
        }
    }
}

// MARK: Appointments Struct
struct Appointments: Identifiable {
    var id = UUID()
    var name: String
    var company: String
    var message: String
}


// MARK: AppointmentsView Singleton
class AppointmentsView: ObservableObject {
    static let shared = AppointmentsView()  // Singleton instance
    
    @Published var name: String = ""
    @Published var company: String = ""
    @Published var message: String = ""
    
    @Published var appointmentList: [Appointments] = []
    
    private init() {}  // Private initializer to prevent outside instantiation
    
    func addAppointment() {
        let newAppointment = Appointments(name: name,
                                          company: company,
                                          message: message)
        appointmentList.append(newAppointment)
        name = ""
        company = ""
        message = ""
    }
}

// MARK: Appointment Form
struct AppointmentForm: View {
    @ObservedObject var view = AppointmentsView.shared  // Use singleton instance
    var body: some View {
        NavigationStack {
            Form {
                VStack {
                    Text("Add Appointment")
                        .font(.system(size: 14, weight: .bold))
                    TextField("Name", text: $view.name)
                        .frame(height: 40)
                    TextField("Company", text: $view.company)
                        .frame(height: 40)
                    TextField("Message", text: $view.message)
                        .frame(height: 40)
                }
                .padding()
            }
            .frame(width: 600, height: .infinity)
            
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




// MARK: Preview
#Preview {
    Apointment()
        .frame(width: NSScreen.main?.frame.width,
               height: NSScreen.main?.frame.height)
}
