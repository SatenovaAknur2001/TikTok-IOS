//
//  CommentTableViewCell.swift
//  TikTok
//
//  Created by Акнур on 6/6/21.
//  Copyright © 2021 Aknur. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

  static let identifier = "CommentTableVIewCell"
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let commentLabel: UILabel = {
          let label = UILabel()
          label.numberOfLines = 0
          label.textColor = .label
          return label
          
      }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        return label
        
    }()
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(avatarImageView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(commentLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        commentLabel.sizeToFit()
        dateLabel.sizeToFit()
        
        //Assign Frames
        let imageSize: CGFloat = 44
        avatarImageView.frame = CGRect(x: 10, y: 5, width: imageSize, height: imageSize)
       
        let commentLabelHeight = min(contentView.height - dateLabel.top, commentLabel.height)
        commentLabel.frame = CGRect(x: avatarImageView.right + 10,
                                    y: 5,
                                    width: contentView.width - avatarImageView.right - 10, height: commentLabelHeight)
        
        dateLabel.frame = CGRect(
                   x: avatarImageView.right+10,
                   y: commentLabel.bottom,
                   width: dateLabel.width,
                   height: dateLabel.height)
               
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dateLabel.text = nil
        commentLabel.text = nil
        avatarImageView.image = nil
    }
    public func configure(with model: PostComment) {
        commentLabel.text = model.text
        dateLabel.text = .date(with: model.date)
        if let url = model.user.profilePicturedURL {
            print(url)
        }
        else {
            
        
        avatarImageView.image = UIImage(systemName: "person.circle")
    }
    
    }
    
}
