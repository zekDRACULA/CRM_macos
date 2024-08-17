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



#Preview {
    Analytics()
}
