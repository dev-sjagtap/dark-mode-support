
import UIKit

final class TeacherTableViewCell: UITableViewCell {
    
    // MARK:- Properties
	@IBOutlet private weak var thumbnailBorderView: UIView!
	@IBOutlet private weak var thumbnailImageView: UIImageView!
	@IBOutlet private weak var nameLabel: UILabel!

    // MARK:- Life cycle methods
	override func awakeFromNib() {
		super.awakeFromNib()

		thumbnailBorderView.layer.cornerRadius = 45
		thumbnailBorderView.layer.masksToBounds = true

		thumbnailImageView.layer.cornerRadius = 41
		thumbnailImageView.layer.masksToBounds = true
	}

    // MARK:- Public methods
	func setTeacher(_ teacher: Teacher) {
		nameLabel.text = teacher.name
		thumbnailImageView.image = UIImage(named: teacher.imageName)
	}
}
