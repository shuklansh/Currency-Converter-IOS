//
//  ContentView.swift
//  TestApp
//
//  Created by www.abcom.in on 17/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var silverText = ""
    @State var goldText = ""
//    @State var showChangeCurrencyScreen = false
    var body: some View {
        ZStack{
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack{
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                HStack{
                    VStack{
                        HStack{
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
//                                .onTapGesture {
//                                    showChangeCurrencyScreen.toggle()
//                                }
//                                .sheet(
//                                    isPresented: $showChangeCurrencyScreen,
//                                    content: { SelectCurrencyView(selectedItem: CurrencyInfoItem(
//                                        currencyImageResource: .silverpiece,
//                                        currencyName: "Silver piece")
//                                    ) }
//                                )
                            Text("Silver \npiece")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding(12)
                        }
                        TextField("Amount", text: $silverText)
                            .foregroundStyle(.white)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .symbolEffect(.pulse)
                        .padding(8)
                    VStack{
                        HStack{
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Text("Gold \npiece")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding(12)
                        }
                        TextField("Amount", text: $goldText)
                            .foregroundStyle(.white)
                            .textFieldStyle(.roundedBorder)
                    }
                }.padding(.horizontal,18)
                    .padding(.bottom,19)
                    .background(.black.opacity(0.4))
                    .clipShape(.capsule)
                Spacer()
                HStack{
                    Spacer()
                    Button{
                        print("showExchangeInfo == before == \(showExchangeInfo)")
                        showExchangeInfo.toggle()
                        print("showExchangeInfo == after == \(showExchangeInfo)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.white)
                            .scaledToFit()
                            .frame(height: 20)
                            .padding(12)
                    }.sheet(isPresented: $showExchangeInfo, content: {
                        ExchangeInfoView()
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
