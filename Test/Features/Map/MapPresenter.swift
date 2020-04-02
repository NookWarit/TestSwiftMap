import Foundation
protocol MapPresentationLogic {
    func presentFetchDataSuccess(response: Map.FetchData.Response)
    func presentFetchDataFail()
}

class MapPresenter: MapPresentationLogic {
    // MARK: - Variable
    var viewController: MapDisplayLogic?
    
    // MARK: - Life Cycle
    deinit {
        print("MapPresenter DEINIT")
    }
    
    // MARK: - Presentation Logic
    func presentFetchDataSuccess(response: Map.FetchData.Response) {
        let viewModel = Map.FetchData.ViewModel(data: response.data)
        viewController?.displayFetDataSuccess(viewModel: viewModel)
    }
    
    func presentFetchDataFail() {
        viewController?.displayFetDataFail()
    }
}
