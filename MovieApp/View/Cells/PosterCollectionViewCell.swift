//
//  PosterCollectionViewCell.swift
//  MovieApp
//
//  Created by Vladislav Sitsko on 06.10.2022.
//

import UIKit
import SDWebImage

class PosterCollectionViewCell: UICollectionViewCell {
    
    //MARK: Constants
    private static let baseImageUrl = "https://image.tmdb.org/t/p/w500"
    
    private lazy var infoContainer = UIView()
    
    private lazy var posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var releaseDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.gray
        return label
    }()
    
    private lazy var genres: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.gray
        return label
    }()
    
    private lazy var rating: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = UIColor.green
        return label
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        
        stackView.addArrangedSubviews([
            infoStackView,
            ratingStackView
        ])
        return stackView
    }()
    
    private lazy var ratingStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.addArrangedSubview(rating)
        return stackView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.addArrangedSubviews([
            title,
            releaseDate,
            genres
        ])
        return stackView
    }()
    
    private let blurredEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    var dataSource: Movie? {
        didSet {
            configure()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(named: "backgroundColor")
        
        contentView.addSubview(posterImage)
        posterImage.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        contentView.addSubview(infoContainer)
        infoContainer.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3)
        }
        
        infoContainer.addSubview(blurredEffectView)
        blurredEffectView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        infoContainer.addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImage.image = UIImage(named: "poster_placeholder")
        self.posterImage.sd_cancelCurrentImageLoad()
    }
    
    private func configure() {
        if
            let imagePath = dataSource?.posterPath,
            let imageUrl = URL(string: "\(Self.baseImageUrl)\(imagePath)")
        {
            posterImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "poster_placeholder"))
        } else {
            posterImage.image = UIImage(named: "poster_placeholder")
        }
        
        title.text = dataSource?.originalTitle
        releaseDate.text = dataSource?.releaseDate?.dateFormating()
        genres.text = dataSource?.genre
        rating.text = dataSource?.voteAverage?.description
        rating.setImdbRatingColor()
    }
}
