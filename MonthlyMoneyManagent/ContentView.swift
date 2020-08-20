//
//  ContentView.swift
//  MonthlyMoneyManagent
//
//  Created by Der3k Burrola on 5/31/20.
//  Copyright © 2020 D3Labs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let defaults = UserDefaults.standard
    @State private var appTitle = "Monthly Money Management"
    @State private var spendingMoney = "0.0"
    @State private var currentMoney = "200.00"
    
    
    var body: some View {
        VStack{
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Monthly Money Management"/*@END_MENU_TOKEN@*/)
                    .font(.title)
                Spacer()
                VStack{
                    Spacer()
                    Spacer()
                    Text("$\(currentMoney)")
                        .onAppear(perform: loadMoney)
                        .font(.system(size: 80))
                    Divider()
                        .frame(width: 300, height: 100)
                    HStack{
                        Spacer()
                        TextField("$", text: $spendingMoney)
                            .padding(.horizontal)
                            .font(.system(size: 40))
                            .frame(width: 200.0, height: 50.0)
                            .font(.title).multilineTextAlignment(.center)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            self.removeMoney(defaults: self.defaults)
                        }) {
                            Text("-")
                        }
                            .frame(width: 50, height: 50)
                            .padding()
                            //.background(Color.blue)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .font(.system(size: 80))

                        Button(action: {
                            self.addMoney(defaults: self.defaults)
                        }) {
                            Text("+")
                        }
                            .frame(width: 50, height: 50)
                            .padding()
                            //.background(Color.blue)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .font(.system(size: 80))
                        Spacer()
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }.background(Rectangle().fill(Color.green).edgesIgnoringSafeArea(.all))
            VStack{
                Button(action: {
                    self.resetMoney()
                }) {
                    Text("Reset Budget")
                }
                .font(.title)
                .padding()
                .background(Color.blue)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.blue, lineWidth: 5)
                )
            }
            Spacer()
            Spacer()
        }.background(Rectangle().fill(Color.green).edgesIgnoringSafeArea(.all))
        
    }
    

    func removeMoney(defaults: UserDefaults){
        currentMoney = String(Double(currentMoney)! - Double(spendingMoney)!)
        //Store in defaults
        defaults.set(currentMoney, forKey:"currentMoney")
    }

    func addMoney(defaults: UserDefaults){
        currentMoney = String(Double(currentMoney)! + Double(spendingMoney)!)
        //Store in defaults
        defaults.set(currentMoney, forKey:"currentMoney")
    }
    
    func loadMoney(){
        currentMoney = defaults.object(forKey:"currentMoney") as? String ?? "200.0"
    }
    
    func resetMoney(){
        currentMoney = "200.00"
        defaults.set(currentMoney, forKey:"currentMoney")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


