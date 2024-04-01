//
//  CurrencyInputView.swift
//  TestApp
//
//  Created by www.abcom.in on 21/03/24.
//

import SwiftUI

struct CurrencyInputView: View {
    @Binding var currencyInput: Currency
    @Binding var currencyAmount: String
    @Binding var showSelectCurrencyView: Bool
    var body: some View {
        VStack{
            HStack{
                Image(currencyInput.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)                
                Text(currencyInput.name)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(12)
            }.onTapGesture {
                print("showSelectCurrencyView == before == \(showSelectCurrencyView)")
                showSelectCurrencyView.toggle()
                print("showSelectCurrencyView == after == \(showSelectCurrencyView)")
            
            }
            TextField("Amount", text: $currencyAmount)
                .foregroundStyle(.black)
                .textFieldStyle(.roundedBorder)
        }
    }
}
