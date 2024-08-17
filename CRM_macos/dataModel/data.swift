//
//  data.swift
//  CRM_macos
//
//  Created by Abhay singh on 17/08/24.
//

import Foundation
import SwiftUI

//MARK: struct for expected revenue growth
//MARK: ERG = ExpectedRevenueGrowth
struct ERG : Identifiable{
    
    var id: UUID = UUID()
    var year : String
    var revenue : Float
}

//MARK: data for Expected Revenue Growth
let ERGData : [ERG] = [
    ERG(year: "2020", revenue: 500),
    ERG(year: "2022", revenue: 550),
    ERG(year: "2023", revenue: 605),
    ERG(year: "2024", revenue: 665),
    ERG(year: "2025", revenue: 730),
    ERG(year: "2026", revenue: 800),
    ERG(year: "2027", revenue: 875),
]



//MARK: struct for Sales across Regions -> cars, bikes and wathces
//MARK: SAR = Sales Across Region
struct SAR : Identifiable{
    
    var id: UUID = UUID()
    var year : String
    var carRevenue : Float
    var bikeRevenue : Float
    var watchRevenue : Float
}

//MARK: data for Sales Across Regions
let SARData: [SAR] = [
    SAR(year: "2018", carRevenue: 464, bikeRevenue: 290, watchRevenue: 213),
    SAR(year: "2019", carRevenue: 424, bikeRevenue: 282, watchRevenue: 169),
    SAR(year: "2020", carRevenue: 445, bikeRevenue: 280, watchRevenue: 302),
    SAR(year: "2021", carRevenue: 498, bikeRevenue: 358, watchRevenue: 291),
    SAR(year: "2022", carRevenue: 368, bikeRevenue: 300, watchRevenue: 200),
    SAR(year: "2023", carRevenue: 379, bikeRevenue: 302, watchRevenue: 253),
    SAR(year: "2024", carRevenue: 316, bikeRevenue: 344, watchRevenue: 319),
]


//MARK: struct for region market share
//MARK: RMS = Region Market Share
struct RMS : Identifiable{
    var id : UUID = UUID()
    var carShare : Float
    var bikeShare  : Float
    var watchShare : Float
}

//MARK: data for Region market share
let RMSData : RMS = RMS(carShare: 41, bikeShare: 32, watchShare: 27)

//MARK: Ledends
struct GraphsLegends : Identifiable {
    
    var id = UUID()
    var product : String
    var color : Color
}

//MARK: data for Legends
let LegendsData : [GraphsLegends] = [
    GraphsLegends(product: "Cars", color: .blue),
    GraphsLegends(product: "Bikes", color:.green),
    GraphsLegends(product: "Watches", color: .orange),
    GraphsLegends(product: "Default", color: .mint),
]


