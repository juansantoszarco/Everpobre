//
//  JSZDatesTableViewCell.h
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 05/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JSZNote.h"

@class JSZNote;

@interface JSZDatesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *creationDate;

@property (weak, nonatomic) IBOutlet UILabel *modificationDate;


@property (nonatomic,strong) JSZNote *note;

+(CGFloat)height;

+(NSString*)cellId;

@end
