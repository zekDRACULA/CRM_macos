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

#Preview {
    Dashboard()
        .frame(width: NSScreen.main?.frame.width, height: NSScreen.main?.frame.height)
}
