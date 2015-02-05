//
//  JSZPhotoViewController.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 05/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "JSZPhotoViewController.h"
#import "JSZNote.h"
#import "JSZPhotoContainer.h"

@interface JSZPhotoViewController ()

@end

@implementation JSZPhotoViewController


-(id) initWithModel:(JSZNote*)note{
    
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model= note;
    }
    return self;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.photoView.image = self.model.photo.image;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.model.photo.image = self.photoView.image;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)takePhoto:(id)sender {
    
    
}

- (IBAction)deletePhoto:(id)sender {
    
    
}




@end
