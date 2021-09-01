//
//  ProductDetailView.swift
//  Modern-SwiftUI-MVVM-Tests
//
//  Created by Burhan Aras on 28.08.2021.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel
    
    var body: some View {
        VStack {
            switch viewModel.data{
            case let .success(product): productDetail(product)
            case let .failure(error):
               ErrorView(error: error)
            case .none:
               LoadingView()
            }
        }
        .onAppear{
            viewModel.loadProductDetail()
        }
    }

    func productDetail(_ product: Product) -> some View{
        VStack {
            AsyncImage(
                url: viewModel.productImage,
                placeholder: { ProgressView() },
                image: { Image(uiImage: $0).resizable() }
            )
            .frame(width: 40, height: 40, alignment: .center)
            .padding()
            
            Text(product.title) .font(.title)
            Text(product.productGroupType).font(.body)
            Text(product.price).font(.body)
            Spacer()
        }
        .padding()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            // Successful
            ProductDetailView(viewModel: ProductDetailViewModel(networkLayer: DummyNetworkLayer(), productId: "1234"))
            ProductDetailView(viewModel: ProductDetailViewModel(networkLayer: DummyNetworkLayer(), productId: "1234"))
                .colorScheme(.dark)
            
            // Failing
            ProductDetailView(viewModel: ProductDetailViewModel(networkLayer: DummyFailingNetworkLayer(), productId: "1234"))
            ProductDetailView(viewModel: ProductDetailViewModel(networkLayer: DummyFailingNetworkLayer(), productId: "1234"))
                .colorScheme(.dark)
        }
    }
}
