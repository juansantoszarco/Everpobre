//
//  JSZNotesViewController.h
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 04/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
#import "JSZNotebook.h"

@interface JSZNotesViewController : AGTCoreDataTableViewController

@property (strong,nonatomic) JSZNotebook *notebook;

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
