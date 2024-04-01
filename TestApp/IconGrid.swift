//
//  IconGrid.swift
//  TestApp
//
//  Created by www.abcom.in on 21/03/24.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currencySelected: Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if (currency == currencySelected) {
                    CurrencyView(
                        currencyImageResource: currency.image,
                        currencyName: currency.name
                    )
                    .shadow(color: .black, radius: 8)
                    .overlay{
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(lineWidth: 3)
                    }
                } else {
                    CurrencyView(
                        currencyImageResource: currency.image,
                        currencyName: currency.name
                    ).onTapGesture {
                        self.currencySelected = currency
                    }
                }
            }
        }.padding(EdgeInsets(top: 20, leading: 90, bottom: 20, trailing: 90))
    }
}

//                ScrollView(.horizontal,  showsIndicators: false) {
//                    LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
//                        ForEach(currencyInfoList) { currencyInfoListItem in
//                            CurrencyView(
//                                currencyImageResource: currencyInfoListItem.currencyImageResource,
//                                currencyName: currencyInfoListItem.currencyName
////                                selectedItem: selectedItem
//                            )
//                        }
//                    }.padding(EdgeInsets(top: 20, leading: 90, bottom: 20, trailing: 90))
//                }

//#Preview {
//    IconGrid(currencySelected: Currency.goldPenny)
//}
