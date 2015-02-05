//
//  JSZNotebookTableViewCell.h
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 05/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSZNotebookTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *nameView;

@property (weak, nonatomic) IBOutlet UILabel *notesView;


+(CGFloat) height;

+(NSString* )cellId;


@end
