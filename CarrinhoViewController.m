//
//  CarrinhoViewController.m
//  CarrinhoAliexpress
//
//  Created by dainf on 09/03/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import "CarrinhoViewController.h"
#import "ItemCompra.h"

@interface CarrinhoViewController ()

@end

@implementation CarrinhoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _compraDao = [CompraDao compraDaoInstance];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_compraDao size];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    ItemCompra *item = [_compraDao itemNaLinha:indexPath.row];
    cell.textLabel.text = item.produto.nome;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Quantidade '%f' vezes '%f' igual '%f'", item.quantidade, item.produto.valor, item.valor];
    return cell;
}

@end
