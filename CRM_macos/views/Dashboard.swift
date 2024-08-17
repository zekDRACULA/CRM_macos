//
//  Dashboard.swift
//  CRM_macos
//
//  Created by Abhay singh on 17/08/24.
//

import SwiftUI

struct Dashboard: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let dashboardOptions = ["Open Tasks", "Leads", "Closing This Month"]

    var body: some View {
        Showcard(columns: columns, dashboardOptions: dashboardOptions)
        }
    }

#Preview {
    Dashboard()
        .frame(width: NSScreen.main?.frame.width, height: NSScreen.main?.frame.height)
}
