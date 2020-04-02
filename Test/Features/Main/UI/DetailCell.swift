import UIKit

class DetailCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        for view in stackView.arrangedSubviews {
            view.removeFromSuperview()
        }
    }
    
    // MARK: - Function
    func configureCell(data: Main.FetchData.ViewModel.DisplayStation) {
        name.text = data.name
        time.text = data.time
        let availableDock = DetailView()
        availableDock.configureView(title: "Available Dock", value: data.availableDock)
        stackView.addArrangedSubview(availableDock)
        let totalDock = DetailView()
        totalDock.configureView(title: "Total Dock", value: data.totalDock)
        stackView.addArrangedSubview(totalDock)
        let availableBike = DetailView()
        availableBike.configureView(title: "Available Bike", value: data.availableBike)
        stackView.addArrangedSubview(availableBike)
        latitude.text = data.latitude
        longitude.text = data.longitude
    }
    
}
