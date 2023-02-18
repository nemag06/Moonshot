//
//  AstronautThumbnailView.swift
//  Moonshot
//
//  Created by Magomet Bekov on 31.01.2023.
//

import SwiftUI

struct AstronautThumbnailView: View {
  
    let crewMember: MissionView.CrewMember
    
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .strokeBorder(.white,
                                      lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .foregroundColor(.white)
                    .font(.headline)
                
                Text(crewMember.role)
                    .foregroundColor(.secondary)
            }
        }
    }
}

//struct AstronautThumbnailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AstronautThumbnailView(crewMember: crew)
//    }
//}
