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
                ERGGraphs()
                RMS
            }
            SARGraph()
        }
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
struct SARGraph : View {
    var body: some View {
        Chart{
                    ForEach(SARData) { data in
                            BarMark(
                                x: .value("Year", data.year),
                                y: .value("Car Revenue", data.carRevenue)
                            )
                            .foregroundStyle(.blue)
                            .lineStyle(StrokeStyle(lineWidth: 2))
                        }
                        
                        
                        ForEach(SARData) { data in
                            BarMark(
                                x: .value("Year", data.year),
                                y: .value("Bike Revenue", data.bikeRevenue)
                            )
                            .foregroundStyle(.green)
                            .lineStyle(StrokeStyle(lineWidth: 2))
                        }
                        

                        ForEach(SARData) { data in
                            BarMark(
                                x: .value("Year", data.year),
                                y: .value("Watch Revenue", data.watchRevenue)
                            )
                            .foregroundStyle(.orange)
                            .lineStyle(StrokeStyle(lineWidth: 2))
                        } 
        }
    }
}

//MARK: RMS graph via pie chart
struct RMSGraph : View {
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let path = Path { path in
                path.move(to: CGPoint(x: size / 2, y: size / 2))
                path.addArc(
                    center: CGPoint(x: size / 2, y: size / 2),
                    radius: size / 2,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: false
                )
            }
            path.fill(self.color)
        }
    }
}

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
