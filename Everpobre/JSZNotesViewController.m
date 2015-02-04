//
//  JSZNotesViewController.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 04/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "JSZNotesViewController.h"
#import "JSZNote.h"
#import "JSZPhotoContainer.h"

@interface JSZNotesViewController ()

@end

@implementation JSZNotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //agregamos el boton de añadir notas
    //Añadimos botones de añadir nueva libreta, ponemos button system porque queremos un standart
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                           target:self action:@selector(addNote:)];
    //meto a la barra superior, ya que tiene una propiedad para ello
    self.navigationItem.rightBarButtonItem = addBtn;
    
}


//Para que nos de el nombre del titulo de la nota, se  le hace en notebooksviewcontroller didSelectRowAtIndexPath le asigno notesVC.notebook = nb;
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = self.notebook.name;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //averiguamos la nota
    JSZNote *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //crear la celda
    static NSString *cellID = @"noteCell";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    //la configuramos
    
    cell.imageView.image= n.photo.image;
    
    cell.textLabel.text = n.name;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    
    fmt.dateStyle = NSDateIntervalFormatterMediumStyle;
    
    cell.detailTextLabel.text = [fmt stringFromDate:n.modificationDate];
    
    if ([n.name isEqualToString:@"Nueva Nota"]) {
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",n.name]];
    }else{
    
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",n.name]];
    }
    
    //la devolvemos
    
    return cell;
    
    
}



-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //averiguar si el pollo quiere eliminar
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //borramos el objeto al comprobar que esta borrando
        NSManagedObjectContext *ctx = self.fetchedResultsController.managedObjectContext;
        
        JSZNote *difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:difunto];
        
    }
    
    
}

-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return @"Eliminar";
    }
    return @"Remove";
}

#pragma  mark - Utils

-(void) addNote:(id) sender{
    [JSZNote noteWithName:@"Nueva Nota"
                 notebook:self.notebook
                  context:self.notebook.managedObjectContext];
    
}




@end
