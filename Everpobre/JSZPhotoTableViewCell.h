//
//  JSZPhotoTableViewCell.h
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 05/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JSZNote;

@interface JSZPhotoTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (nonatomic,strong) JSZNote * note;

+(CGFloat)height;

+(NSString*)cellId;

@end
