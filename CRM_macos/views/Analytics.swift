//
//  Analytics.swift
//  CRM_macos
//
//  Created by Abhay singh on 17/08/24.
//

import SwiftUI
import Charts



struct Analytics: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                LegendView()
                Spacer()
                ERGGraphs()
                Spacer()
                RMSGraph()
                Spacer()
            }
            SARGraph()
        }
    }
}
#Preview {
    Analytics()
}
