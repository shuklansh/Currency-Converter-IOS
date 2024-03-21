//
//  SelectCurrencyView.swift
//  TestApp
//
//  Created by www.abcom.in on 10/03/24.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismissSelectCurrencyView
//    var selectedItem: CurrencyInfoItem
    @State var currencySelectedFrom: Currency
    @State var currencySelectedTo: Currency
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
//    var currencyList = [
//        Currency(currencyImageResource: .copperpenny,
//                         currencyName: "copper penny"),
//        Currency(currencyImageResource: .silverpenny,
//                         currencyName: "silver penny"),
//        Currency(currencyImageResource: .goldpenny,
//                         currencyName: "gold penny"),
//        Currency(currencyImageResource: .silverpiece,
//                         currencyName: "silver piece"),
//        Currency(currencyImageResource: .goldpiece,
//                         currencyName: "gold piece")
//    ]
    var body: some View {
//        let selectedItem = selectedItem
        ZStack{
            Image(.parchment)
                .resizable()
                .scaledToFill()
                .background(Color.brown)
                .ignoresSafeArea()
            VStack{
                CurrencyChangeView(selectCurrencyText: "Select the currency you are starting with:")
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
                IconGrid(currencySelected: currencySelectedFrom)
                CurrencyChangeView(selectCurrencyText: "Select the currency you would like to convert to:")
                IconGrid(currencySelected: currencySelectedTo)
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
                .padding(EdgeInsets(top: 0, leading: 90, bottom: 0, trailing: 90))
        }
    }
}

struct CurrencyView: View {
    var currencyImageResource: ImageResource
    var currencyName: String
//    var selectedItem: CurrencyInfoItem
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

#Preview{
    SelectCurrencyView(
        currencySelectedFrom: Currency.goldPiece,
        currencySelectedTo: Currency.silverPiece
    )
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

//struct CurrencyInfoItem {
//    let currencyImageResource: ImageResource
//    let currencyName: String
//}
