//
//  JSZNotebooksViewController.m
//  Everpobre
//
//  Created by Juan Antonio de los Santos on 04/02/15.
//  Copyright (c) 2015 Juan Antonio de los Santos. All rights reserved.
//

#import "JSZNotebooksViewController.h"

#import "JSZNotebook.h"

@interface JSZNotebooksViewController ()

@end

@implementation JSZNotebooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"EverPobre";
    
    //Añadimos botones de añadir nueva libreta, ponemos button system porque queremos un standart
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                           target:self action:@selector(addNotebook:)];
    //meto a la barra superior, ya que tiene una propiedad para ello
    self.navigationItem.rightBarButtonItem = addBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //averiguamos de que libreta me habla
    JSZNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    
    //creo una celda
    static NSString *cellId = @"NotebookId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil){
        
        //se crea la celda desde 0
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellId];
        
        
    }
    //la configuro (sincronizo modelo -> vista)
    cell.textLabel.text = nb.name;
    
    //se formatea la celda
    NSDateFormatter *fmt = [NSDateFormatter new];
    
   // fmt.dateStyle = NSDateFormatterShortStyle;
    
    [fmt setDateFormat:@"dd/MM/yyyy"];
    //se crea la fecha de la celda con el formateador y pasandole los parametros
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@  (total notes:%lu)",[fmt stringFromDate:nb.modificationDate],(unsigned long)nb.notes.count];
    
    //la devuelvo
    
    return cell;
    
}


-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //averiguar si el pollo quiere eliminar
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //borramos el objeto al comprobar que esta borrando
        NSManagedObjectContext *ctx = self.fetchedResultsController.managedObjectContext;
        
        JSZNotebook *difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:difunto];
        
    }
    
    
}

-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return @"Eliminar";
    }
    return @"Remove";
}

#pragma  mark - Actions

-(void) addNotebook:(id) sender{
    
    //creamos un a nueva libreta, todo objeto de coreData se conoce el contexto, self.fetchedResultsController.managedObjectContext
    //tiene fectched result controller porque hereda de la superclase CoreDatatableviewcontroller
    
    [JSZNotebook notebookWithName:@"Nueva libreta" context:self.fetchedResultsController.managedObjectContext];
    
}





@end
