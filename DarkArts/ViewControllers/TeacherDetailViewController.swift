
import UIKit

final class TeacherDetailViewController: UIViewController {
	private let teacher: Teacher

	@IBOutlet private weak var headerBackgroundView: UIView!
	@IBOutlet private weak var imageView: UIImageView! {
		didSet {
			imageView.layer.cornerRadius = 64
			imageView.layer.masksToBounds = true
		}
	}
	@IBOutlet private weak var nameLabel: UILabel!
	@IBOutlet private weak var houseImageView: UIImageView!
	@IBOutlet private weak var houseLabel: UILabel!
	@IBOutlet private weak var yearsAtHogwartsLabel: UILabel!

	init?(coder: NSCoder, teacher: Teacher) {
		self.teacher = teacher
		super.init(coder: coder)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
        
        // to set light or dark mode only for this viewController
//        overrideUserInterfaceStyle = .light
        
		imageView.image = UIImage(named: teacher.imageName)
		nameLabel.text = teacher.name
		yearsAtHogwartsLabel.text = "\(teacher.startingYear)-\(teacher.endingYear)"
		houseLabel.text = teacher.house.name

        headerBackgroundView.backgroundColor = UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor(white: 0.3, alpha: 1.0)
            default:
                return UIColor(white: 0.7, alpha: 1.0)
            }
        }

		switch teacher.house {
		case .gryffindor:
			houseLabel.textColor = .systemRed
		case .hufflepuff:
			houseLabel.textColor = .systemYellow
		case .ravenclaw:
			houseLabel.textColor = .systemBlue
		case .slytherin:
			houseLabel.textColor = .systemGreen
		}

        houseImageView.image = UIImage(systemName: "house.fill")
        houseImageView.tintColor = houseLabel.textColor
	}
}
