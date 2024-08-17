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
        ERGGraphs()
    }
}

//MARK: graph for expected Revenue Growth via bar Graph
struct ERGGraphs : View {
    var body: some View {
        Chart{
            ForEach(ERGData){ data in
                BarMark(x: .value("year", data.year),
                        y: .value("Revenue", data.revenue))
            }
        }
        .frame(maxWidth: 600, maxHeight: 400)
    }
}

//MARK: SAR graph via joined bar graph


//MARK: Graph holder card
struct GraphCard : View {
    let columns : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        Text("Hele")
    }
}

#Preview {
    Analytics()
//        .frame(width: NSScreen.main?.frame.width, height: NSScreen.main?.frame.height)
}
