import UIKit

protocol MainDisplayLogic: class {
    func displayGetDataSuccess(viewModel: Main.FetchData.ViewModel)
    func displayGetDataFail()
}

class MainViewController: UIViewController, MainDisplayLogic {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    var interactor: MainBusinessLogic?
    var router: MainRouter?
    let detailCell = "DetailCell"
    var displayStations: [Main.FetchData.ViewModel.DisplayStation] = []
    
    // MARK: - Life Cycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configurator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configurator()
    }
    
    deinit {
        print("MainViewController DEINIT")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        interactor?.getData()
    }
    
    // MARK: - Function
    func configurator() {
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()

        router.dataStore = interactor
        router.viewController = self
        self.router = router
        interactor.presenter = presenter
        presenter.viewController = self
        self.interactor = interactor
    }
    
    func setupView() {
        tableView.register(UINib(nibName: detailCell, bundle: nil),
                           forCellReuseIdentifier: detailCell)
    }
    
    // MARK: - Display Logic
    func displayGetDataSuccess(viewModel: Main.FetchData.ViewModel) {
        displayStations = viewModel.displayStation
        tableView.reloadData()
    }
    
    func displayGetDataFail() {
        print("Fail!")
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayStations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: detailCell,
                                                       for: indexPath) as? DetailCell else { return UITableViewCell() }
        
        cell.configureCell(data: Main.FetchData.ViewModel.DisplayStation(name: displayStations[indexPath.row].name,
                                                               time: displayStations[indexPath.row].time,
                                                               availableDock: displayStations[indexPath.row].availableDock,
                                                               totalDock: displayStations[indexPath.row].totalDock,
                                                               availableBike: displayStations[indexPath.row].availableBike,
                                                               latitude: displayStations[indexPath.row].latitude,
                                                               longitude: displayStations[indexPath.row].longitude))
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router?.routeToMap(data: self.displayStations[indexPath.row])
    }
}
