//
//  CurrencyInputView.swift
//  TestApp
//
//  Created by www.abcom.in on 21/03/24.
//

import SwiftUI

struct CurrencyInputView: View {
    @State var currencyInput: Currency
    @State var currencyAmount = ""
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
            }
            TextField("Amount", text: $currencyAmount)
                .foregroundStyle(.white)
                .textFieldStyle(.roundedBorder)
        }
    }
}
