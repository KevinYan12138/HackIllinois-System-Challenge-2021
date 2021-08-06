//
//  ContentView.swift
//  HackIllinois2021
//
//  Created by Guanwen yan on 7/21/21.
//

import SwiftUI
import Kingfisher

struct API: Codable {
    let id : String
    let data : [Mentors]

    
}

struct Mentors: Codable, Identifiable {
    let id = UUID()
    let firstName: String
    let lastName : String
    let description : String
    let profile : String
}


struct ContentView: View {
    
    @State var mentors = [Mentors]()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(mentors){mentor in
                    ZStack(alignment: .top){
                        RoundedRectangle(cornerRadius: 15).strokeBorder(SwiftUI.Color.gray, lineWidth: 0.5)
                            .background(SwiftUI.Color.white)
                            
                        VStack(alignment: .center, spacing:10){
                            KFImage(URL(string: mentor.profile)!).resizable().scaledToFit()
                            Text(mentor.firstName + " " + mentor.lastName).font(.headline)
                            Text(mentor.description).font(.caption).padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5))
                        }
                    }.clipShape(RoundedRectangle(cornerRadius: 15)).shadow(color: .gray, radius: 12, x: 0, y: 2)
                }
            }.navigationTitle("Mentors").navigationBarTitleDisplayMode(.inline)
        }.onAppear(){
            apiCall().fetch { (mentors) in
                self.mentors = mentors
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
