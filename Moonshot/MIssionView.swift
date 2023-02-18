//
//  MIssionView.swift
//  Moonshot
//
//  Created by Magomet Bekov on 31.01.2023.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                        .accessibility(hidden: true)
                    
                    Text(mission.formattedLaunchDate)
                        .foregroundColor(.secondary)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        ViewDivider()
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                            .accessibilityElement(children: .ignore)
                            .accessibility(label: Text("\(mission.displayName). \(mission.formattedLaunchDate)"))
                    }
                    .padding(.horizontal)
                    
                    AstronautsHorizontalListView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] =
    Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        Group {
            MissionView(mission: missions[0], astronauts: astronauts)
                .preferredColorScheme(.dark)
            MissionView(mission: missions[0], astronauts: astronauts)
                .preferredColorScheme(.dark)
        }
    }
}
