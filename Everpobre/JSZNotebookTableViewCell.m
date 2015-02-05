//
//  JSZNotebookTableViewCell.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 05/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "JSZNotebookTableViewCell.h"

@implementation JSZNotebookTableViewCell



+(CGFloat) height{
    
    return 60.0f;
    
}

+(NSString* )cellId{
    
    return [self description];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
