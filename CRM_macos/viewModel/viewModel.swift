//
//  viewModel.swift
//  CRM_macos
//
//  Created by Abhay singh on 18/08/24.
//

import Foundation
import SwiftUI
import Charts
//MARK: --------------------------------------------Analytics----------------------------------------------//

    
    //MARK: Legend view
 struct LegendView : View {
        var body: some View {
            VStack(alignment: .leading){
                ForEach(LegendsData){ data in
                    HStack{
                        Rectangle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(data.color)
                            .padding(.trailing)
                        Text(data.product)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            
                    }
                }
            }
        }
    }

    //MARK: graph for expected Revenue Growth via bar Graph
 struct ERGGraphs : View {
        var body: some View {
            VStack{
                Text("Expected Revenue Growth")
                    .font(.system(size: 14))
                    .frame(width: .infinity, height: .infinity, alignment: .topLeading)
                    .foregroundColor(.white)
                Chart{
                    ForEach(ERGData){ data in
                        BarMark(x: .value("year", data.year),
                                y: .value("Revenue", data.revenue))
                        .foregroundStyle(.mint)
                        
                    }
                }
            }
            .frame(maxWidth: 600, maxHeight: 400)
        }
    }

    //MARK: SAR graph via joined bar graph
    struct SARGraph : View {
        var body: some View {
            VStack {
                Text("Revenue Across Products")
                    .font(.system(size: 14))
                    .frame(width: .infinity, height: .infinity, alignment: .topLeading)
                    .foregroundColor(.white)
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
    }

    //MARK: RMS graph via pie chart
    struct RMSGraph : View {
       
        var body: some View {
            
            VStack{
                Text("Proudct Market Share")
                    .font(.system(size: 14))
                    .frame(width: .infinity, height: .infinity, alignment: .topLeading)
                    .foregroundColor(.white)
                    
                PieChart(data: RMSData)
            }
        }
    }

    //MARK: making PieChart
    struct PieSliceView: View {
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

    // MARK: - PieChartView
    struct PieChart: View {
        var data: RMS
        
        // MARK: - Flatten Data and Calculate Angles
        private func calculateAngles() -> [Angle] {
            let total = data.carShare + data.bikeShare + data.watchShare
            let shares = [data.carShare, data.bikeShare, data.watchShare]
            var angles: [Angle] = []
            var currentAngle: Double = -90
            
            for share in shares {
                let angle = Double(share / total * 360)
                angles.append(.degrees(currentAngle))
                currentAngle += angle
            }
            angles.append(.degrees(currentAngle))
            
            return angles
        }
        
        var body: some View {
            let angles = calculateAngles()
            let colors: [Color] = [.blue, .green, .orange]
            
            return ZStack {
                ForEach(0..<3, id: \.self) { index in
                    PieSliceView(
                        startAngle: angles[index],
                        endAngle: angles[index + 1],
                        color: colors[index]
                    )
                }
            }
            .frame(width: 200, height: 200)
        }
    }

//MARK:--------------------------------------------Dashboard----------------------------------------------//


// MARK: Showing sidebar item
struct showSideBarOptionList: View {
    let sideBarOptions: [String]
    @Binding var selectedItem : String?
    var body: some View {
        List(selection: $selectedItem){
            ForEach(sideBarOptions, id: \.self){ sideBarOption in
                Text(sideBarOption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 14, weight: .medium))
            }
        }
    }
}

// MARK: Card for showing  dashboard cards
struct Showcard: View {
    
    let columns : [GridItem]
    let dashboardOptions : [String]
    
    var body: some View {
        HStack(alignment: .center) {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(dashboardOptions, id: \.self) { dashboardOption in
                        ZStack {
                            // Glassmorphism effect
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.white.opacity(0.1))
                                .background(BlurView())
                                .background(RoundedRectangle(cornerRadius: 25).stroke(Color.white.opacity(0.3), lineWidth: 1))
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                                .frame(width: (((NSScreen.main?.frame.width ?? 0) - 200) / 2),
                                       height: 400)
                                .overlay(
                                    ZStack {
                                        Text(dashboardOption)
                                            .font(.system(size: 14, weight: .medium))
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                            .padding()
                                            .foregroundColor(.white)
                                        VStack(spacing: -10) {
                                            Image(systemName: "plus")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(maxWidth: 40, maxHeight: 40)
                                                .padding()
                                                .foregroundColor(.white)
                                            Text("Create New")
                                                .font(.system(size: 14))
                                                .foregroundColor(.white)
                                        }
                                    }
                                )
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct BlurView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = .hudWindow // Use .light, .dark, or .ultraDark for different effects
        view.blendingMode = .withinWindow
        view.state = .active
        return view
    }
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}
    
