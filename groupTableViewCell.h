//
//  groupTableViewCell.h
//  tomatoes
//
//  Created by Manmada Reddy Nallagonda on 2/4/15.
//  Copyright (c) 2015 Manmada Reddy Nallagonda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface groupTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *groupImage;
@property (weak, nonatomic) IBOutlet UILabel *groupName;
@property (weak, nonatomic) IBOutlet UILabel *groupDescription;

@end
