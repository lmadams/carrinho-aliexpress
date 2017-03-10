//
//  Compra.m
//  CarrinhoAliexpress
//
//  Created by dainf on 09/03/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import "Compra.h"

@implementation Compra

-(Compra*) init{
    self = [super init];
    self.itens = [NSMutableArray new];
    return self;
}

@end
