//
//  AstronautsHorizontalListView.swift
//  Moonshot
//
//  Created by Magomet Bekov on 31.01.2023.
//

import SwiftUI

struct AstronautsHorizontalListView: View {
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        AstronautThumbnailView(crewMember: crewMember)
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}



//struct AstronautsHorizontalListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AstronautsHorizontalListView(.)
//    }
//}
