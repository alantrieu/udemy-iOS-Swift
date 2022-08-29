//
//  ContentView.swift
//  MyCard
//
//  Created by Alan Trieu on 29/8/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .ignoresSafeArea()
            VStack {
                Image("laptop-code-solid")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0)
                    .clipShape(Rectangle())
//                    .overlay(
//                        Circle().stroke(Color.white, lineWidth: 5)
//                    )
                
                Text("Alan Trieu")
                    .font(Font.custom("Nunito-Regular", size: 40))
                    .bold()
                .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                Divider()
                InfoView(text: "+61 414 921 970", imageName: "phone.fill")
                InfoView(text: "alan.trieu.dev@gmail.com", imageName: "envelope.fill")

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
