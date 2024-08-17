//
//  ContentView.swift
//  CRM_macos
//
//  Created by Abhay singh on 17/08/24.
//

import SwiftUI

struct ContentView: View {
    
    let sideBarOptions = ["Dashboard", "Analytics", "Appointments", "Lead Details"]
    let dashboardOptions = ["Open Tasks", "Leads", "Closing This Month"]
    @State private var selectedItem : String? = "DashBoard"
    var body: some View {
        
        NavigationSplitView {
            //MARK: side bar here
            showSideBarOptionList(sideBarOptions: sideBarOptions, selectedItem: $selectedItem)
                
            
            
        } detail: {
            //MARK: details here
            
            if let selectedItem{
                switch selectedItem{
                case "Dashboard" :
                    Dashboard()
                        .navigationTitle(selectedItem)
                case "Analytics" :
                    Analytics()
                        .navigationTitle(selectedItem)
                case "Appointments" :
                    AppointmentView()
                        .navigationTitle(selectedItem)
                case "Lead Details" :
                    LeadDetailView()
                        .navigationTitle(selectedItem)
                default:
                    Dashboard()
                        .navigationTitle("Dashboard")
                }
            }
            
        }
    }
        
}

#Preview {
    ContentView()
}
