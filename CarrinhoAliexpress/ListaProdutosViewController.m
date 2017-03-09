//
//  ListaProdutosViewController.m
//  CarrinhoAliexpress
//
//  Created by dainf on 09/03/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import "ListaProdutosViewController.h"

@interface ListaProdutosViewController ()

@end

@implementation ListaProdutosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //    Add btn para o carrinho de compras
    UIBarButtonItem *btnCarrinho = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                 target:self
                                                                                 action:@selector(onClickCarrinho)];
    self.navigationItem.rightBarButtonItem = btnCarrinho;
    
    self.produtoDao = [ProdutoDao produtoDaoInstance];
}

//Metodo onClick para ir ate o carrinho de compras
- (void) onClickCarrinho {
    UIStoryboard *storeBoard = [UIStoryboard storyboardWithName: @"Main"
                                                         bundle: nil];
    UIViewController *carrinhoView = [storeBoard instantiateViewControllerWithIdentifier: @"CarrinhoView"];
    
    [self.navigationController pushViewController: carrinhoView
                                         animated: YES];
}

// Vai para os detalhes do produto
-(IBAction) onClickProduto {
    
    UIStoryboard *storeBoard = [UIStoryboard storyboardWithName: @"Main"
                                                         bundle: nil];
    UIViewController *detalheProduto = [storeBoard instantiateViewControllerWithIdentifier: @"DetalheProdutosView"];
    
    [self.navigationController pushViewController: detalheProduto
                                         animated: YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
