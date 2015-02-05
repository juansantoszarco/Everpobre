//
//  JSZNoteViewController.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 05/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#define NUMBER_OF_SECTIONS 4
#define NAME_SECTION_HEADER @"Name"
#define DATES_SECTION_HEADER @"Created and last modified"
#define TEXT_SECTION_HEADER @"Text"
#define PHOTO_SECTION_HEADER @"Photo"
#define NAME_SECTION 0
#define DATES_SECTION 1
#define TEXT_SECTION 2
#define PHOTO_SECTION 3


#import "JSZNoteViewController.h"

#import "JSZNote.h"

#import "JSZNameTableViewCell.h"

#import "JSZPhotoTableViewCell.h"

#import "JSZTextTableViewCell.h"

#import "JSZDatesTableViewCell.h"

#import "JSZPhotoViewController.h"

@interface JSZNoteViewController ()

@end

@implementation JSZNoteViewController


#pragma mark - Initializers

-(id)initWithModel:(JSZNote*) model{
    if(self = [super initWithNibName:nil bundle:nil]){
        _note = model;
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerNibs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    // Return the number of sections.
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case NAME_SECTION:
            return [JSZNameTableViewCell height];
            break;
            
        case DATES_SECTION:
            return [JSZDatesTableViewCell height];
            break;
    
        case TEXT_SECTION:
            return [JSZTextTableViewCell height];
            break;
            
        case PHOTO_SECTION:
            return [JSZPhotoTableViewCell height];
            break;
            
        default:
            return 0.0f;
            break;
    }
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case NAME_SECTION:
            return NAME_SECTION_HEADER;
            break;
        case DATES_SECTION:
            return DATES_SECTION_HEADER;
            break;
        case TEXT_SECTION:
            return TEXT_SECTION_HEADER;
            break;
        case PHOTO_SECTION:
            return PHOTO_SECTION_HEADER;
            break;
        default:
            [NSException raise:@"Section no existe" format:nil];
            return @"este no existe ";
            break;
    }
    
}

-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //averiguamos de que celda habla
    switch (indexPath.section) {
        case NAME_SECTION:{
            
            JSZNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSZNameTableViewCell cellId]
                                                                         forIndexPath:indexPath];
            //Actualizamos el model con KVO
            [cell setNote:self.note];
            return cell;
            break;}
        case DATES_SECTION:{
            JSZDatesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[JSZDatesTableViewCell cellId]
                                                                           forIndexPath:indexPath];
            //Actualizamos con kvo
            [cell setNote:self.note];
            return cell;
            break;}
        case TEXT_SECTION:{
            JSZTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSZTextTableViewCell cellId]
                                                                         forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;}
        case PHOTO_SECTION:{
            JSZPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSZPhotoTableViewCell cellId]
                                                                          forIndexPath:indexPath];
            [cell setNote:self.note];
            
            return cell;
            break;}
            
        default:
            [NSException raise:@"Unknown section" format:@"Unknown section %d",indexPath.section];
            return nil;
            break;
    }
    
    
    
}





#pragma  mark - Utils

-(void)registerNibs{
    
    //Registramos todas las celdas
    
    NSBundle *main = [NSBundle mainBundle];
    
    UINib *nameNib = [UINib nibWithNibName:@"JSZNameTableViewCell" bundle:main];
    
    [self.tableView registerNib:nameNib forCellReuseIdentifier:[JSZNameTableViewCell cellId]];
    
    UINib *datesNib = [UINib nibWithNibName:@"JSZDatesTableViewCell" bundle:main];
    
    [self.tableView registerNib:datesNib forCellReuseIdentifier:[JSZDatesTableViewCell cellId]];
    
    UINib *photoNib = [UINib nibWithNibName:@"JSZPhotoTableViewCell" bundle:main];
    
    [self.tableView registerNib:photoNib forCellReuseIdentifier:[JSZPhotoTableViewCell cellId]];
    
    UINib *textNib = [UINib nibWithNibName:@"JSZTextTableViewCell" bundle:main];
    
    [self.tableView registerNib:textNib forCellReuseIdentifier:[JSZTextTableViewCell cellId]];
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == PHOTO_SECTION) {
        
        
        //mostramos el controlador de fotos
        
        JSZPhotoViewController *pVC = [[JSZPhotoViewController alloc]initWithModel:self.note];
        
        //pusheamos
        [self.navigationController pushViewController:pVC animated:YES];
        
    }
    
}



@end
