//
//  SelectCurrencyView.swift
//  TestApp
//
//  Created by www.abcom.in on 10/03/24.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismissSelectCurrencyView
    var selectedItem: CurrencyInfoItem
    let currencyInfoList = [
        CurrencyInfoItem(currencyImageResource: .copperpenny, 
                         currencyName: "copper penny"),
        CurrencyInfoItem(currencyImageResource: .silverpenny,
                         currencyName: "silver penny"),
        CurrencyInfoItem(currencyImageResource: .goldpenny, 
                         currencyName: "gold penny"),
        CurrencyInfoItem(currencyImageResource: .silverpiece, 
                         currencyName: "silver piece"),
        CurrencyInfoItem(currencyImageResource: .goldpiece,
                         currencyName: "gold piece")
    ]
    var body: some View {
        let selectedItem = selectedItem
        ZStack{
            Image(.parchment)
                .resizable()
                .scaledToFill()
                .background(Color.brown)
                .ignoresSafeArea()
            VStack{
                CurrencyChangeView(selectCurrencyText: "Select the currency you are starting with:")
//                ScrollView(.horizontal,  showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
                        ForEach(currencyInfoList) { currencyInfoListItem in
                            CurrencyView(
                                currencyImageResource: currencyInfoListItem.currencyImageResource,
                                currencyName: currencyInfoListItem.currencyName,
                                selectedItem: selectedItem
                            )
                        }
                    }.padding(EdgeInsets(top: 20, leading: 90, bottom: 20, trailing: 90))
//                }
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
    var selectedItem: CurrencyInfoItem
    var body: some View {
        if (currencyImageResource == selectedItem.currencyImageResource) {
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
            .background(Color.black.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius:25))
        } else {
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
}

//CurrencyView(currencyImageResource: .copperpenny, currencyName: "copper penny")
//CurrencyView(currencyImageResource: .silverpenny, currencyName: "silver penny")
//CurrencyView(currencyImageResource: .goldpenny, currencyName: "gold penny")
//CurrencyView(currencyImageResource: .silverpiece, currencyName: "silver piece")
//CurrencyView(currencyImageResource: .goldpiece, currencyName: "gold piece")

class CurrencyInfoItem: Identifiable {
    var currencyName: String
    var currencyImageResource: ImageResource
    
    init(currencyImageResource: ImageResource, currencyName: String) {
        self.currencyName = currencyName
        self.currencyImageResource = currencyImageResource
    }
}
