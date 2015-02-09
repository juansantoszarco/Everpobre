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
    
    //crear un picker
    UIImagePickerController *picker = [UIImagePickerController new];
    
    
    //Configuramos, preguntando poco a poco
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //tenemos camara
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        //pos nos conformammos con el carrete
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    picker.delegate = self;
    
    //personalizar el picker para que cambie la transicion, cuidado con el curl que falla
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    
    //presentamosview
    [self presentViewController:picker
                        animated:YES
                      completion:^{
                          NSLog(@"Fin de Imagen");
                      }];
    
    
    
    
}

- (IBAction)deletePhoto:(id)sender {
    //hay que guardar los bounds y el alpha porque si los modificamos quedan alterados,en el completion al final se reasignan los calores
    CGRect oldRect = self.photoView.bounds;
    //Animacion
    
    [UIView animateKeyframesWithDuration:0.8
                                   delay:0.0
                                 options:0
                              animations:^{
                                  
                                  
                                  //Estado final (se va animar)
                                  self.photoView.bounds = CGRectZero;
                                  self.photoView.alpha = 0;
                              }
                              completion:^(BOOL finished) {
                                  //cuando acaba la animacion la quito del modelo y de la vista
                                  //quitar la foto del modelo
                                  
                                  self.model.photo.image = nil;
                                  
                                  //quitar la foto de la vista
                                  
                                  self.photoView.image = nil;
                                  
                                  //dejamos la vista como estaba
                                  self.photoView.bounds = oldRect;
                                  self.photoView.alpha = 1.0;
                              }];
    
    
    
    
}


#pragma mark - UIImagepickercontrollerdelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //OJO pico de memoria que nos puede cerrar la aplicacion
    
    self.model.photo.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    //ahora queda ocultar el picker porque al redefinir el metodo le tenemos que decir nosotros que se oculte
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
    
    
}



@end
