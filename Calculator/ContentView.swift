//
//  ContentView.swift
//  Calculator
//
//  Created by MultiLab PRT on 16/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State var values = "0"
    @State var previous = 0.0
    @State var result = 0.0
    
    @State var operation = 0
    @State var previousOperation = 0
    
    func removeZerosFromEnd(value: Double) -> String {
        let f = NumberFormatter()
        let number = NSNumber(value: value)
        f.minimumFractionDigits = 0
        f.maximumFractionDigits = 16
        return f.string(from: number) ?? ""
        
    }
    
    func process(digit: Int){
        if operation > 0{
            result = 0
            previousOperation = operation
            operation = -1
        }
        result = (result * 10) + Double(digit)
    }
    
    func reset (){
        previous = 0
        result = 0
        previousOperation = 0
        operation = 0
    }
    
    func calculate (){
        if previousOperation == 1 { //soma
            result = previous + result
            previousOperation = 0
        } else if previousOperation == 2 { //subtração
            result = previous - result
            previousOperation = 0
        }else if previousOperation == 3 { //multiplicação
            result = previous * result
            previousOperation = 0
        }else if previousOperation == 4 { //divisão
            result = previous / result
            previousOperation = 0
        }
        previous = result
    }
    
    var body: some View {
        VStack(alignment: .trailing , spacing: 0) {
            
            Spacer()
            HStack{
                Text(String(removeZerosFromEnd(value: result)))
                    .padding()
                    .lineLimit(1)
                    .font(.system(size: CGFloat(80 / Int((Double(String(result).count + 10) / 8.0)) )))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: true, vertical: false)
            }
            
            HStack(spacing: 0){
                Button("AC"){
                    reset()
                    
                }.padding()
                    .frame(maxWidth: .infinity)
                   
                Button("+/-"){
                    result = result * -1
                    calculate()
                }.padding()
                .frame(maxWidth: .infinity)
                    
                Button("%"){
                    result = result / 100
                    calculate()
                }.padding()
                .frame(maxWidth: .infinity)
                    
                Button("/"){
                    calculate()
                    operation = 4
                    
                }.padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(Color.white)
                    
            }.foregroundColor(Color.blue)
            
            HStack(spacing: 0){
                Button("7"){
                    process(digit: 7)
                }.padding()
                    .frame(maxWidth: .infinity)
                   
                Button("8"){
                    process(digit: 8)
                }.padding()
                .frame(maxWidth: .infinity)
                    
                Button("9"){
                    process(digit: 9)
                }.padding()
                .frame(maxWidth: .infinity)
                    
                Button("X"){
                    calculate()
                    operation = 3
                }.padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(Color.white)
                    
            }.foregroundColor(Color.blue)
            HStack(spacing: 0){
                Button("4"){
                    process(digit: 4)
                }.padding()
                    .frame(maxWidth: .infinity)
                   
                Button("5"){
                    process(digit: 5)
                }.padding()
                .frame(maxWidth: .infinity)
                    
                Button("6"){
                    process(digit: 6)
                }.padding()
                .frame(maxWidth: .infinity)
                    
                Button("-"){
                    calculate()
                    operation = 2
                }.padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(Color.white)
            }.foregroundColor(Color.blue)
            
            HStack(spacing: 0){
                Button("1"){
                    process(digit :1)
                    
                    
                }.padding()
                    .frame(maxWidth: .infinity)
                   
                Button("2"){
                   process(digit: 2)
                }.padding()
                .frame(maxWidth: .infinity)
                    
                Button("3"){
                    process(digit: 3)
                }.padding()
                .frame(maxWidth: .infinity)
                    
                Button("+"){
                    calculate()
                    operation = 1
                }.padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(Color.white)
                    
            }.foregroundColor(Color.blue)
            GeometryReader{ geometry in
                HStack(spacing: 0){
                    Button("0"){
                        process(digit: 0)
                    }
                    .padding()
                    .frame(minWidth: geometry.size.width/2)
                    
                    Button("."){
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    Button("="){
                        calculate()
                        previous = 999
                        operation = 999
                    }
                    .padding(.vertical, 40)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                }.foregroundColor(Color.blue)
            }.frame(maxHeight:92)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
