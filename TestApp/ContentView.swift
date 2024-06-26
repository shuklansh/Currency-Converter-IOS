//
//  ContentView.swift
//  TestApp
//
//  Created by www.abcom.in on 17/11/23.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrencyView = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency = Currency.silverPiece
    @State var rightCurrency = Currency.goldPiece
   
    @FocusState var leftTyping
    @FocusState var rightTyping
    
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
                    CurrencyInputView(
                        currencyInput: $leftCurrency,
                        otherCurrencyInput: $rightCurrency,
                        currencyAmount: $leftAmount,
                        otherCurrencyAmount: $rightAmount,
                        showSelectCurrencyView: $showSelectCurrencyView,
                        focused: $leftTyping
                    )
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .symbolEffect(.pulse)
                        .padding(8)
                    CurrencyInputView(
                        currencyInput: $rightCurrency,
                        otherCurrencyInput: $leftCurrency,
                        currencyAmount: $rightAmount,
                        otherCurrencyAmount: $leftAmount,
                        showSelectCurrencyView: $showSelectCurrencyView,
                        focused: $rightTyping
                    )
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
                    }
                    .sheet(isPresented: $showExchangeInfo, content: {
                        ExchangeInfoView()
                    })
                    .sheet(isPresented: $showSelectCurrencyView, content: {
                        SelectCurrencyView(
                            currencySelectedFrom: $leftCurrency,
                            currencySelectedTo: $rightCurrency
                        )
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
