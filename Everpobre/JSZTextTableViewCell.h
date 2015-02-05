//
//  JSZTextTableViewCell.h
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 05/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

@import UIKit;
#import "JSZNote.h"

@interface JSZTextTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic,strong)JSZNote *note;

+(CGFloat)height;

+(NSString*)cellId;

@end
