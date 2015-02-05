//
//  JSZNameTableViewCell.h
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 05/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

@import UIKit;

@class JSZNote;

@interface JSZNameTableViewCell : UITableViewCell


+(CGFloat)height;

+(NSString*)cellId;

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (nonatomic,strong) JSZNote *note;


@end
