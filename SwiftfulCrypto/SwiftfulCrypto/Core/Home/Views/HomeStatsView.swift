//
//  HomeStatsView.swift
//  SwiftfulCrypto
//
//  Created by Ernest Gaisie on 13/02/2025.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortdolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { statistic in
                StatisticView(stat: statistic)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortdolio ? .trailing : .leading)
    }
}

struct HomeStatsView_Preview: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortdolio: .constant(true))
            .environmentObject(dev.homeVM)
    }
}
