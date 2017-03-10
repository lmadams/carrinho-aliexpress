//
//  CompraDao.m
//  CarrinhoAliexpress
//
//  Created by dainf on 09/03/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import "CompraDao.h"
#import "DBManager.h"

@interface CompraDao()

@property Compra *compra;
@property DBManager *dbManager;
@property NSInteger lastId;

@end
@implementation CompraDao
static CompraDao *instance = nil;
+(CompraDao*)compraDaoInstance{
    if(!instance){
        instance = [CompraDao new];
    }
    return instance;
}

-(CompraDao*)init{
    self = [super init];
    self.compra = [Compra new];
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename: @"carrinho_aliexpres.sql"];
    NSString *query = @"SELECT * FROM compra";
    NSArray *rows = [self.dbManager loadDataFromDB: query];
    _lastId = [rows count] + 1;
    return self;
}

-(void)addItem:(ItemCompra *)item{
    [self.compra.itens addObject:item];
}

-(int)size{
    return [_compra.itens count];
}

-(ItemCompra*) itemNaLinha:(NSInteger)index{
    return [_compra.itens objectAtIndex:index];
}

-(void)salvar{
    for(int i = 0; i < [_compra.itens count]; i++){
        ItemCompra *item = [_compra.itens objectAtIndex:i];
        _compra.valor = _compra.valor + item.valor;
    }
    _compra.codigo = _lastId;
    NSString *query = [NSString stringWithFormat:@"INSERT INTO compra values ('%d', '2017-03-09', '%f', 'Cartao')",
                       _lastId, _compra.valor];
    [_dbManager executeQuery:query];
    _compra.codigo = 10;
    for(int i = 0; i < [_compra.itens count]; i++){
        ItemCompra *item = [_compra.itens objectAtIndex:i];
        item.codCompra = _compra.codigo;
        query = [NSString stringWithFormat:@"INSERT INTO produto_compra values ( '%d', '%d', '%f', '%f')",
                           item.produto.codigo, item.codCompra, item.quantidade, item.valor];
        [_dbManager executeQuery:query];
        
        
    }
    NSLog(@"%@", [NSString stringWithFormat:@"Linhas: %d", self.dbManager.affectedRows]);
}

@end
