//
//  SelectCurrencyView.swift
//  TestApp
//
//  Created by www.abcom.in on 10/03/24.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismissSelectCurrencyView
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .scaledToFill()
                .background(Color.brown)
                .ignoresSafeArea()
            VStack{
                CurrencyChangeView(selectCurrencyText: "Select the currency you are starting with:")
                ScrollView(.horizontal,  showsIndicators: false) {
                    LazyHGrid(rows: [GridItem()]) {
                        CurrencyView(currencyImageResource: .copperpenny, currencyName: "copper penny")
                        CurrencyView(currencyImageResource: .silverpenny, currencyName: "silver penny")
                        CurrencyView(currencyImageResource: .goldpenny, currencyName: "gold penny")
                        CurrencyView(currencyImageResource: .silverpiece, currencyName: "silver piece")
                        CurrencyView(currencyImageResource: .goldpiece, currencyName: "gold piece")
                    }.padding(EdgeInsets(top: 20, leading: 90, bottom: 20, trailing: 90))
                
                }
                CurrencyChangeView(selectCurrencyText: "Select the currency you would like to convert to:")
                Button("Done") {
                    dismissSelectCurrencyView()
                }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.brown)
                    .padding()
                    .font(.title3)
                    .foregroundColor(.white)
            }.padding()
        }
    }
}

struct CurrencyChangeView: View {
    var selectCurrencyText: String
    var body: some View {
        HStack{
            Text(selectCurrencyText)
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 100))
        }
    }
}

struct CurrencyView: View {
    var currencyImageResource: ImageResource
    var currencyName: String
    var body: some View {
        ZStack(alignment: .bottom){
            Image(currencyImageResource)
                .resizable()
                .scaledToFit()
                .frame(width:110, height: 110)

            Text(currencyName)
                .padding(2)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(Color.brown.opacity(0.75))
        }
        .padding()
        .frame(width: 115, height: 115)
        .background(Color.brown)
        .clipShape(RoundedRectangle(cornerRadius:25))
    }
}

#Preview {
    SelectCurrencyView()
}
