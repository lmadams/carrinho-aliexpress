//
//  ListaProdutosViewController.m
//  CarrinhoAliexpress
//
//  Created by dainf on 09/03/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import "ListaProdutosViewController.h"
#import "ProdutoDetalheViewController.h"
#import "CarrinhoViewController.h"

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

    
    CarrinhoViewController *vc = [CarrinhoViewController new];
    
    //    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: vc];
    [self.navigationController pushViewController: vc
                                         animated: YES];
}

// Vai para os detalhes do produto
-(IBAction) onClickProduto:(Produto*) produto {
    
    UIStoryboard *storeBoard = [UIStoryboard storyboardWithName: @"Main"
                                                         bundle: nil];
    ProdutoDetalheViewController *detalheProduto = [storeBoard instantiateViewControllerWithIdentifier: @"DetalheProdutosView"];
    
    detalheProduto.produto = produto;
    
    [self.navigationController pushViewController: detalheProduto
                                         animated: YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_produtoDao size];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    Produto *produto = [_produtoDao produtoNaLinha:indexPath.row];
    cell.textLabel.text = produto.nome;
    cell.detailTextLabel.text = produto.descricao;
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Produto *produto = [_produtoDao produtoNaLinha:indexPath.row];
    [self onClickProduto:produto];
}

@end
