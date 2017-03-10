//
//  CompraDao.m
//  CarrinhoAliexpress
//
//  Created by dainf on 09/03/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import "CompraDao.h"
@interface CompraDao()

@property Compra *compra;

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

@end
