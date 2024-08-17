//
//  data.swift
//  CRM_macos
//
//  Created by Abhay singh on 17/08/24.
//

import Foundation

//MARK: struct for expected revenue growth
//MARK: ERG = ExpectedRevenueGrowth
struct ERG : Identifiable{
    
    var id: UUID = UUID()
    var year : String
    var revenue : Float
}

//MARK: struct for Sales across Regions -> cars, bikes and wathces
//MARK: SAR = Sales Across Region
struct SAR : Identifiable{
    
    var id: UUID = UUID()
    var year : String
    var carRevenue : Float
    var bikeRevenue : Float
    var watchRevenue : Float
}

//MARK: struct for region market share
//MARK: RMS = Region Market Share
struct RMS : Identifiable{
    var id : UUID = UUID()
    var carShare : Float
    var bikeShare  : Float
    var watchShare : Float
}

//MARK: data for Region market share
let RMSData : [RMS] = [
    RMS(carShare: 41, bikeShare: 32, watchShare: 270)
]

//MARK: data for Sales Across Regions
let SARData : [SAR] = [
    SAR(year: "2018", carRevenue: 450, bikeRevenue: 350, watchRevenue: 200),
    SAR(year: "2019", carRevenue: 470, bikeRevenue: 320, watchRevenue: 210),
    SAR(year: "2020", carRevenue: 380, bikeRevenue: 300, watchRevenue: 320),
    SAR(year: "2021", carRevenue: 450, bikeRevenue: 350, watchRevenue: 300),
    SAR(year: "2022", carRevenue: 445, bikeRevenue: 340, watchRevenue: 250),
    SAR(year: "2013", carRevenue: 460, bikeRevenue: 320, watchRevenue: 270),
    SAR(year: "2014", carRevenue: 410, bikeRevenue: 320, watchRevenue: 270),
]


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

