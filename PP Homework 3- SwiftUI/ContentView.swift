//
//  ContentView.swift
//  PP Homework 3- SwiftUI
//
//  Created by Anthony Tsang on 16/7/2022.
//

import SwiftUI


let image = Image("Community")

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack (spacing: 0){
                NavigationLink{
                    RightPersonView()
                } label: {
                    VStack {
                        Text("You are already accepted")
                            .font(.title)
                        .foregroundColor(.green)
                        Image("Community/Greendale Flag")
                            .resizable()
                            .scaledToFit()
                            .frame(width:200, height: 200)
                    }
                }
            }
        }
        .navigationTitle("那個人是你嗎？")
    }
}

struct RightPersonView:View {
    
    @State private var currentPage = 0
    
    var body: some View {
       
        VStack {
            TabView (selection: $currentPage) {
                ForEach(1..<8){ item in
                    VStack (spacing: 0){
                        Image("numberCommunity2/\(item)")
                        ScrollView {
                            Text(charaDes[item-1])
                                .padding()
                        }
                        Text("I am the \(currentPage+1) of Greendale Seven")
                            .scaledToFit()
                        Button {
                           currentPage = (currentPage + 1) % 7
                        } label: {
                            Image(systemName: "arrow.right.circle.fill")
                               .resizable()
                               .frame(width: 40, height: 40)
                        }
                        .padding(.bottom)
                    }
                }
            }
            
            .tabViewStyle(.page)
            .padding()
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            

            
            
        }
        /*
        VStack {
            Image("Jeff")
                .resizable()
                .scaledToFit()
                .navigationTitle("Jeff")
                .navigationBarTitleDisplayMode(.inline)
            NavigationLink{
                
            } label: {
                Text("City College")
            }
            
                
        }
        */
    }
}

struct WrongPersonView:View {
    var body: some View {
        VStack {
            Image("cityCollegeDean")
                .resizable()
                .scaledToFit()
                .navigationTitle("City College")
                .navigationBarTitleDisplayMode(.inline)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RightPersonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RightPersonView()
        }
    }
}
